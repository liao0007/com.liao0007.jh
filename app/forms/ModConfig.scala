package forms

import play.api.data.Form
import play.api.data.Forms._

case class ModConfig(setup: String, overrides: String)

object ModConfig {
  val form = Form(
    mapping(
      "setup" -> nonEmptyText,
      "overrides" -> nonEmptyText
    )(ModConfig.apply)(ModConfig.unapply)
  )
}
