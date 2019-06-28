module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Input as Input
import Html
import Html.Attributes exposing (style)
import Json.Encode
import LngLat exposing (LngLat)
import MapCommands
import Mapbox.Cmd.Option as Opt
import Mapbox.Element exposing (..)
import Mapbox.Expression as E exposing (false, float, int, str, true)
import Mapbox.Layer as Layer
import Mapbox.Source as Source
import Mapbox.Style as Style exposing (Style(..))
import Styles.Swisstopo


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \m -> Sub.none
        }


init () =
    ( { position = LngLat 8.52 47.38, features = [] }, Cmd.none )


type Msg
    = Hover EventData
    | Click EventData
    | GoToCoord LngLat


update msg model =
    case msg of
        GoToCoord coord ->
            ( model
            , flyToCmd coord 14
            )

        Hover { lngLat, renderedFeatures } ->
            ( { model
                | position = lngLat
                , features = renderedFeatures
              }
            , Cmd.none
            )

        Click { lngLat, renderedFeatures } ->
            ( { model
                | position = lngLat
                , features = renderedFeatures
              }
            , flyToCmd (LngLat 8.5439571 47.3782183) 17
              --, MapCommands.fitBounds [ Opt.linear True, Opt.maxZoom 15 ] ( LngLat.map (\a -> Debug.log "lng" a - 0.002) lngLat, LngLat.map (\a -> Debug.log "lat" a + 0.002) lngLat )
            )


flyToCmd coord zoomLevel =
    MapCommands.flyTo
        [ Opt.center coord
        , Opt.zoom zoomLevel
        , Opt.animate True
        , Opt.curve 2

        --, bearing = Supported
        --, pitch = Supported
        --, around = Supported
        --, duration = Supported
        --, easing = Supported
        --, offset = Supported
        --, minZoom = Supported
        --, speed = Supported
        --, screenSpeed = Supported
        --, maxDuration = Supported
        --}
        ]


hoveredFeatures : List Json.Encode.Value -> MapboxAttr msg
hoveredFeatures =
    List.map (\feat -> ( feat, [ ( "hover", Json.Encode.bool True ) ] ))
        >> featureState


view model =
    { title = "Mapbox Beispiel mit Swisstopo-Daten"
    , body =
        [ Element.layoutWith { options = [] }
            []
          <|
            row
                [ width fill
                , height fill
                ]
                [ column
                    [ width (px 200)
                    , height fill
                    ]
                    [ Input.button [ padding 5 ]
                        { onPress = Just (GoToCoord (LngLat 8.7286826 47.4989597))
                        , label = text "Nach Winti fliegen"
                        }
                    , Input.button [ padding 5 ]
                        { onPress = Just (GoToCoord (LngLat 8.5432295 47.3781895))
                        , label = text "Nach Zürich"
                        }
                    ]
                , Element.html css
                , el
                    [ width fill
                    , height fill
                    , inFront (el [ padding 10, alignBottom ] (text (LngLat.toString model.position)))
                    ]
                    (Element.html
                        (Mapbox.Element.map
                            [ maxZoom 19
                            , onMouseMove Hover
                            , onClick Click
                            , id "my-map"
                            , eventFeaturesLayers [ "changes" ]
                            , hoveredFeatures model.features
                            ]
                            Styles.Swisstopo.style
                        )
                    )
                ]
        ]

    {- [ css
       , div [ style "width" "100vw", style "height" "100vh" ]
           [ map
               [ maxZoom 18
               , onMouseMove Hover
               , onClick Click
               , id "my-map"
               , eventFeaturesLayers [ "changes" ]
               , hoveredFeatures model.features
               ]
               Styles.Swisstopo.style

            (Style
                  { transition = Style.defaultTransition
                  , light = Style.defaultLight
                  , sources =
                      [ Source.vectorFromUrl "composite" "mapbox://mapbox.mapbox-terrain-v2,mapbox.mapbox-streets-v7"
                      , Source.geoJSONFromValue "changes" [] geojson
                      ]
                  , misc =
                      [ Style.name "light"
                      , Style.defaultCenter <| LngLat 20.39789404164037 43.22523201923144
                      , Style.defaultZoomLevel 1.5967483759772743
                      , Style.sprite "mapbox://sprites/mapbox/streets-v7"
                      , Style.glyphs "mapbox://fonts/mapbox/{fontstack}/{range}.pbf"
                      ]
                  , layers =
                      [ Layer.background "background"
                          [ E.rgba 246 246 244 1 |> Layer.backgroundColor
                          ]
                      , Layer.fill "landcover"
                          "composite"
                          [ Layer.sourceLayer "landcover"
                          , E.any
                              [ E.getProperty (str "class") |> E.isEqual (str "wood")
                              , E.getProperty (str "class") |> E.isEqual (str "scrub")
                              , E.getProperty (str "class") |> E.isEqual (str "grass")
                              , E.getProperty (str "class") |> E.isEqual (str "crop")
                              ]
                              |> Layer.filter
                          , Layer.fillColor (E.rgba 227 227 227 1)
                          , Layer.fillOpacity (float 0.6)
                          ]
                      , Layer.symbol "place-city-lg-n"
                          "composite"
                          [ Layer.sourceLayer "place_label"
                          , Layer.minzoom 1
                          , Layer.maxzoom 14
                          , Layer.filter <|
                              E.all
                                  [ E.getProperty (str "scalerank") |> E.greaterThan (int 2)
                                  , E.getProperty (str "type") |> E.isEqual (str "city")
                                  ]
                          , Layer.textField <|
                              E.format
                                  [ E.getProperty (str "name_en")
                                      |> E.formatted
                                      |> E.fontScaledBy (float 1.2)
                                  , E.formatted (str "\n")
                                  , E.getProperty (str "name")
                                      |> E.formatted
                                      |> E.fontScaledBy (float 0.8)
                                      |> E.withFont (E.strings [ "DIN Offc Pro Medium" ])
                                  ]
                          , Layer.textTransform <| E.ifElse (E.getProperty (str "name_en") |> E.isEqual (str "Vienna")) E.uppercase E.none
                          ]
                      , Layer.fill "changes"
                          "changes"
                          [ Layer.fillOpacity (E.ifElse (E.toBool (E.featureState (str "hover"))) (float 0.9) (float 0.1))
                          ]
                      ]
                  }
              )

           , div [ style "position" "absolute", style "bottom" "20px", style "left" "20px" ] [ text (LngLat.toString model.position) ]
           ]
       ]
    -}
    }
