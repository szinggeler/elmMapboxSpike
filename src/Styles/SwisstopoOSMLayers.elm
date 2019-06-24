module Styles.SwisstopoOSMLayers exposing (lyrs)

import LngLat as LngLat
import Mapbox.Expression as E exposing (false, float, str, true)
import Mapbox.Layer as Layer
import Mapbox.Source as Source
import Mapbox.Style as Style exposing (Style(..))


lyrs =
    [ Layer.fill "osm_settlement"
        "OpenMapTiles"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 4
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "residential"))
        , Layer.fillAntialias true
        , Layer.fillOpacity
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 7, float 0 ), ( 10, float 0.30000000000000004 ), ( 14, float 0.30000000000000004 ), ( 15, float 0 ) ]
            )
        , Layer.fillColor (E.rgba 171 171 171 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_landcover_glacier"
        "OpenMapTiles"
        [ Layer.sourceLayer "landcover"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "subclass") |> E.isEqual (str "glacier"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 0 ), ( 12, float 1 ) ])
        , Layer.fillColor (E.rgba 220 240 245 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_landcover_woodland"
        "OpenMapTiles"
        [ Layer.sourceLayer "landcover"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "wood"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 0 ), ( 12, float 1 ) ])
        , Layer.fillColor (E.rgba 220 230 220 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_landuse_leisure"
        "OpenMapTiles"
        [ Layer.sourceLayer "landcover"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "subclass") |> E.matchesStr [ ( "park", true ), ( "recreation_ground", true ) ] false)
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 225 235 205 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_landuse_cemetery"
        "OpenMapTiles"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "cemetery"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 225 235 205 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_landuse_hospital"
        "OpenMapTiles"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "hospital"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 240 240 245 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_hydrology_watercourse_underground"
        "OpenMapTiles"
        [ Layer.sourceLayer "waterway"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "brunnel") |> E.isEqual (str "tunnel"))
        , Layer.lineOpacity (float 1)
        , Layer.lineColor (E.rgba 205 220 230 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13, float 1 ), ( 18, float 3.5 ) ])
        , Layer.lineDasharray (E.floats [ 3, 7 ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class4_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "track", true ), ( "path", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 200 195 190 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ), ( 18, float 4 ) ])
        , Layer.lineDasharray (E.floats [ 0.4, 0.4 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class3_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3 ), ( 18, float 18 ) ])
        , Layer.lineDasharray (E.floats [ 0.4, 0.4 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class3_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 2 ), ( 18, float 15 ) ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class2_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3.5 ), ( 18, float 28 ) ])
        , Layer.lineDasharray (E.floats [ 0.4, 0.4 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class2_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1.5 ), ( 13.5, float 2.5 ), ( 18, float 25 ) ]
            )
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class1_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineDasharray (E.floats [ 0.4, 0.4 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class1_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 10, float 0 ), ( 10.5, float 2 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_highway_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 11.5, float 1 ) ])
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13.5, float 0.5 ), ( 18, float 1.5 ) ])
        , Layer.lineGapWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 3 ), ( 12, float 4 ), ( 14, float 6 ), ( 16, float 10 ), ( 18, float 30 ) ]
            )
        , Layer.lineDasharray (E.floats [ 5, 5 ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_highway_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 1 ), ( 13, float 0.7000000000000001 ) ])
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_transit_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "transit")
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineDasharray (E.floats [ 5, 3 ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_side_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")
                , E.getProperty (str "service")
                    |> E.matchesStr [ ( "siding", true ), ( "yard", true ), ( "spur", true ), ( "crossover", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineDasharray (E.floats [ 5, 3 ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_tunnel"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")

                -- , E.not (E.has (str "service"))
                , E.getProperty (str "brunnel") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 2 ), ( 15, float 3 ), ( 18, float 8 ) ])
        , Layer.lineDasharray (E.floats [ 5, 3 ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_hydrology_watercourse"
        "OpenMapTiles"
        [ Layer.sourceLayer "waterway"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.all [])
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.lineColor (E.rgba 205 220 230 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13, float 2 ), ( 18, float 7 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_hydrology_river"
        "OpenMapTiles"
        [ Layer.sourceLayer "water"
        , Layer.minzoom 8
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "river"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0 ), ( 8.5, float 1 ) ])
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "osm_labels_watercourse"
        "OpenMapTiles"
        [ Layer.sourceLayer "waterway"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter (E.all [])
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 61 168 245 1)
        , Layer.textHaloColor (E.rgba 205 220 230 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 2)
        , Layer.symbolPlacement E.line
        , Layer.symbolSpacing (float 250)
        , Layer.textRotationAlignment E.map
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
        , Layer.textFont (E.strings [ "Roboto Italic" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 13, float 12 ), ( 18, float 16 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.1)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 100)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_hydrology_lake"
        "OpenMapTiles"
        [ Layer.sourceLayer "water"
        , Layer.minzoom 6
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "lake"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (float 1)
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_hydrology_ocean"
        "OpenMapTiles"
        [ Layer.sourceLayer "water"
        , Layer.minzoom 1
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "ocean"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (float 1)
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_ferryservice_car_ferry"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "ferry"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 0.4 ) ])
        , Layer.lineColor (E.rgba 61 168 245 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0.25 ), ( 12, float 1 ), ( 18, float 2.5 ) ])
        , Layer.lineGapWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 3 ), ( 12, float 4 ), ( 14, float 5 ), ( 18, float 25 ) ]
            )
        , Layer.lineDasharray (E.floats [ 5, 3 ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_airtraffic_runway_contour"
        "OpenMapTiles"
        [ Layer.sourceLayer "aeroway"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "runway", true ), ( "taxiway", true ) ] false)
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 5.25 ), ( 12, float 8 ), ( 18, float 53 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class3"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3 ), ( 18, float 18 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class2"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3.5 ), ( 18, float 28 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_highway"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class4"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "track", true ), ( "path", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ), ( 18, float 4 ) ])
        , Layer.lineDasharray (E.floats [ 5, 1 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class3"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 2 ), ( 18, float 15 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class2"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1.5 ), ( 13.5, float 2.5 ), ( 18, float 25 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_airtraffic_runway"
        "OpenMapTiles"
        [ Layer.sourceLayer "aeroway"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "runway", true ), ( "taxiway", true ) ] false)
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 11.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 5 ), ( 12, float 7 ), ( 18, float 50 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 10, float 0 ), ( 10.5, float 2 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_highway"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_transit"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "transit")

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_side"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")
                , E.getProperty (str "service")
                    |> E.matchesStr [ ( "siding", true ), ( "yard", true ), ( "spur", true ), ( "crossover", true ) ] false

                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")

                -- , E.not (E.has (str "service"))
                -- , E.not (E.has (str "brunnel"))
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 2 ), ( 15, float 3 ), ( 18, float 8 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "osm_buildings_"
        "OpenMapTiles"
        [ Layer.sourceLayer "building"
        , Layer.minzoom 14
        , Layer.maxzoom 22
        , Layer.filter (E.all [])
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 14, float 0 ), ( 15, float 1 ) ])
        , Layer.fillColor (E.zoom |> E.interpolate (E.Exponential 1) [ ( 14, E.rgba 225 225 225 1 ), ( 15, E.rgba 204 204 204 1 ) ])

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class3_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3 ), ( 18, float 18 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class2_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 3.5 ), ( 18, float 28 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_class1_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_contour_highway_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class4_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "track", true ), ( "path", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ), ( 18, float 4 ) ])
        , Layer.lineDasharray (E.floats [ 5, 1 ])
        , Layer.lineCap E.square
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class3_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "raceway", true ), ( "service", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 2 ), ( 18, float 15 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class2_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "tertiary", true ), ( "minor", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1.5 ), ( 13.5, float 2.5 ), ( 18, float 25 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_class1_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "primary", true ), ( "secondary", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 255 255 255 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 10, float 0 ), ( 10.5, float 2 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_roadtraffic_highway_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "motorway", true ), ( "trunk", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_transit_contour_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "transit")
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 245 245 245 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1.25 ), ( 15, float 2.5 ), ( 18, float 7 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_side_contour_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")
                , E.getProperty (str "service")
                    |> E.matchesStr [ ( "siding", true ), ( "yard", true ), ( "spur", true ), ( "crossover", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 245 245 245 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1.25 ), ( 15, float 2.5 ), ( 18, float 7 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_contour_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")

                -- , E.not (E.has (str "service"))
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 1 ) ])
        , Layer.lineColor (E.rgba 245 245 245 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 2.25 ), ( 15, float 4 ), ( 18, float 11 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_transit_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "transit")
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_side_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")
                , E.getProperty (str "service")
                    |> E.matchesStr [ ( "siding", true ), ( "yard", true ), ( "spur", true ), ( "crossover", true ) ] false
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 1 ), ( 15, float 1.5 ), ( 18, float 4 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_railtraffic_level1"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "rail")

                -- , E.not (E.has (str "service"))
                , E.getProperty (str "brunnel") |> E.isEqual (str "bridge")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 1 ) ])
        , Layer.lineColor (E.rgba 255 205 205 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 2 ), ( 15, float 3 ), ( 18, float 8 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_aerialways"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "cable_car"))
        , Layer.lineOpacity (float 1)
        , Layer.lineColor (E.rgba 255 143 130 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0.5 ), ( 15, float 0.75 ), ( 18, float 2 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "osm_boundary_"
        "OpenMapTiles"
        [ Layer.sourceLayer "boundary"
        , Layer.minzoom 1
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "admin_level") |> E.isEqual (float 2)
                , E.getProperty (str "maritime") |> E.isEqual (float 0)
                , E.getProperty (str "disputed") |> E.isEqual (float 0)
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 10, float 1 ), ( 12, float 0.30000000000000004 ) ])
        , Layer.lineColor (E.zoom |> E.interpolate (E.Exponential 1) [ ( 10, E.rgba 230 215 230 1 ), ( 12, E.rgba 230 175 230 1 ) ])
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 6, float 2 ), ( 12, float 6 ), ( 18, float 40 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    ]
