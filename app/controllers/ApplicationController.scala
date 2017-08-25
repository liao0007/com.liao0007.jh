package controllers

import com.google.inject.Inject
import forms.{ModConfig, WorldConfig}
import play.api.Environment
import play.api.i18n.I18nSupport
import play.api.mvc._

import sys.process._

/**
  * Created by liangliao on 27/6/17.
  */
class ApplicationController @Inject()(
                                       environment: Environment,
                                       indexTemplate: views.html.Index,
                                       worldConfigTemplate: views.html.WorldConfig,
                                       modConfigTemplate: views.html.ModConfig
                                     ) extends InjectedController with I18nSupport {
  val modSetupFilePath = "uploaded/dedicated_server_mods_setup.lua"
  val modOverridesFilePath = "uploaded/modoverrides.lua"
  val worldFilePathTemplate = "uploaded/leveldataoverride_#.lua"
  val worldCount = 7

  def index(): Action[AnyContent] = Action { implicit requestHeader: RequestHeader =>
    Ok(indexTemplate())
  }

  def restart(): Action[AnyContent] = Action { implicit requestHeader: RequestHeader =>
    val result = (environment.getFile("/shell/restart.sh").getAbsolutePath + " " + environment.rootPath.getAbsolutePath).!!
    Ok(indexTemplate(Some(result)))
  }

  def worldConfig(id: Int): Action[AnyContent] = Action { implicit requestHeader: RequestHeader =>
    val worldFilePath = worldFilePathTemplate.replace("#", id.toString)
    val value: String = getFileContent(worldFilePath)
    Ok(worldConfigTemplate(WorldConfig.form.fill(WorldConfig(value)), id, worldCount))
  }

  def worldUpdate(id: Int): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    WorldConfig.form.bindFromRequest().fold(
      hasErrors = { formWithError =>
        Ok(worldConfigTemplate(formWithError, id, worldCount))
      },
      success = { worldConfig =>
        val worldFilePath = worldFilePathTemplate.replace("#", id.toString)
        val file = environment.getFile(worldFilePath)
        printToFile(file) { printWriter =>
          printWriter.print(worldConfig.value)
        }
        (environment.getFile("/shell/sync_world_config.sh").getAbsolutePath + " " + environment.rootPath.getAbsoluteFile).!!
        Redirect(routes.ApplicationController.worldConfig(id))
      }
    )
  }

  def modConfig: Action[AnyContent] = Action { implicit requestHeader: RequestHeader =>
    val setup: String = getFileContent(modSetupFilePath)
    val overrides: String = getFileContent(modOverridesFilePath)
    Ok(modConfigTemplate(ModConfig.form.fill(ModConfig(setup, overrides))))
  }

  def modUpdate: Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    ModConfig.form.bindFromRequest().fold(
      hasErrors = { formWithError =>
        Ok(modConfigTemplate(formWithError))
      },
      success = { modConfig =>
        val setup = environment.getFile(modSetupFilePath)
        printToFile(setup) { printWriter =>
          printWriter.print(modConfig.setup)
        }

        val overrides = environment.getFile(modOverridesFilePath)
        printToFile(overrides) { printWriter =>
          printWriter.print(modConfig.overrides)
        }

        (environment.getFile("/shell/sync_mod_config.sh").getAbsolutePath + " " + environment.rootPath.getAbsolutePath).!!
        Redirect(routes.ApplicationController.modConfig())
      }
    )

  }


  private def getFileContent(filePath: String): String = {
    environment.getExistingFile(filePath) match {
      case Some(file) =>
        val source = scala.io.Source.fromFile(file)
        try source.mkString finally source.close()
      case _ =>
        scala.reflect.io.File(environment.getFile(filePath)).parent.createDirectory()
        scala.reflect.io.File(environment.getFile(filePath)).createFile()
        ""
    }
  }

  private def printToFile(f: java.io.File)(op: java.io.PrintWriter => Unit) {
    val p = new java.io.PrintWriter(f)
    try {
      op(p)
    } finally {
      p.close()
    }
  }

}
