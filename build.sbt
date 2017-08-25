name := "com.liao0007.jh"

version := "1.0-SNAPSHOT"

scalaVersion := "2.12.3"

updateOptions := updateOptions.value.withCachedResolution(true)

routesGenerator := InjectedRoutesGenerator

lazy val root = (project in file(".")).enablePlugins(PlayScala)

libraryDependencies ++= Seq(
  ehcache,
  ws,
  filters,
  specs2
)

JsEngineKeys.engineType := JsEngineKeys.EngineType.Node
