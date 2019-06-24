module Styles.Swisstopo exposing (style)

import LngLat as LngLat
import Mapbox.Expression as E exposing (false, float, str, true)
import Mapbox.Layer as Layer
import Mapbox.Source as Source
import Mapbox.Style as Style exposing (Style(..))
import Styles.SwisstopoLayers
import Styles.SwisstopoOSMLayers
import Styles.SwisstopoOpenMapTilesLayers


style : Style
style =
    Style
        { transition = Style.defaultTransition
        , light = Style.defaultLight
        , layers =
            [ Layer.background "background_"
                [ Layer.minzoom 1
                , Layer.maxzoom 22
                , Layer.backgroundColor (E.rgba 235 235 235 1)

                --, Layer.visibility (str "visible")
                ]
            ]
                ++ Styles.SwisstopoOSMLayers.lyrs
                ++ Styles.SwisstopoOpenMapTilesLayers.lyrs
                ++ Styles.SwisstopoLayers.lyrs
        , sources =
            [ Source.vectorFromUrl "OpenMapTiles" "https://vectortiles10.geo.admin.ch/mbtiles/org.openstreetmap-openmaptiles.vt/v001.json"
            , Source.vectorFromUrl "Leichte Basiskarte" "https://vectortiles10.geo.admin.ch/mbtiles/ch.swisstopo.leichte-basiskarte.vt/v006.json"
            ]
        , misc =
            [ Style.sprite "https://vectortiles10.geo.admin.ch/gl-styles/ch.swisstopo.leichte-basiskarte.vt/v006/sprite"
            , Style.glyphs "https://vectortiles10.geo.admin.ch/fonts/{fontstack}/{range}.pbf"
            , Style.name "ch.swisstopo.leichte-basiskarte.vt"
            , Style.defaultZoomLevel 12
            , Style.defaultBearing 0
            , Style.defaultPitch 5.5
            , Style.defaultCenter <| LngLat.LngLat 8.52 47.38
            ]
        }
