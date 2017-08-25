package forms

import play.api.data.Form
import play.api.data.Forms._

case class WorldConfig(value: String)

object WorldConfig {
  val form = Form(
    mapping(
      "value" -> nonEmptyText,
    )(WorldConfig.apply)(WorldConfig.unapply)
  )
}
