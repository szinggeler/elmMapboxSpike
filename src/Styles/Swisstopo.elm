module Styles.Swisstopo exposing (style)

import Json.Decode
import Json.Encode
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
                ++ [ Layer.fill "changes"
                        "changes"
                        [ Layer.fillOpacity (E.ifElse (E.toBool (E.featureState (str "hover"))) (float 0.8) (float 0.5))
                        , Layer.fillColor (E.rgba 255 50 50 1)
                        ]
                   ]
        , sources =
            [ Source.vectorFromUrl "OpenMapTiles" "https://vectortiles10.geo.admin.ch/mbtiles/org.openstreetmap-openmaptiles.vt/v001.json"
            , Source.vectorFromUrl "Leichte Basiskarte" "https://vectortiles10.geo.admin.ch/mbtiles/ch.swisstopo.leichte-basiskarte.vt/v006.json"
            , Source.geoJSONFromValue "changes" [] geojson
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


geojson =
    Json.Decode.decodeString Json.Decode.value """
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 1,
      "properties": {
        "name": "Stampfenbachstrasse 12",
        "area": 123
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [ 8.5439571, 47.3782183 ],
            [ 8.5400981, 47.3775590 ],
            [ 8.5415751, 47.3774021 ],
            [ 8.5409962, 47.3765152 ],
            [ 8.5439571, 47.3782183 ]
          ]
        ]
      }
    }
  ]
}
""" |> Result.withDefault (Json.Encode.object [])
