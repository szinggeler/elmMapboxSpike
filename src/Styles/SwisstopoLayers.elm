module Styles.SwisstopoLayers exposing (lyrs)

import LngLat as LngLat
import Mapbox.Expression as E exposing (false, float, str, true)
import Mapbox.Layer as Layer
import Mapbox.Source as Source
import Mapbox.Style as Style exposing (Style(..))


lyrs =
    [ Layer.fill "territory_"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "territory"
        , Layer.minzoom 6
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "territory", true ), ( "enclave", true ) ] false)
        , Layer.fillAntialias true
        , Layer.fillColor (E.rgba 235 235 235 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "settlement_small"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement"
        , Layer.minzoom 8
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass")
                    |> E.matchesStr [ ( "2000-9999", true ), ( "1000-1999", true ), ( "100-999", true ) ] false
                ]
            )
        , Layer.fillAntialias true
        , Layer.fillOpacity
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 10, float 0 ), ( 11, float 0.30000000000000004 ), ( 14, float 0.30000000000000004 ), ( 15, float 0 ) ]
            )
        , Layer.fillColor (E.rgba 171 171 171 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "settlement_10000-49999"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement"
        , Layer.minzoom 8
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "10000-49999")
                ]
            )
        , Layer.fillAntialias true
        , Layer.fillOpacity
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 10, float 0.30000000000000004 ), ( 14, float 0.30000000000000004 ), ( 15, float 0 ) ]
            )
        , Layer.fillColor (E.rgba 171 171 171 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "settlement_50000-100000"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement"
        , Layer.minzoom 8
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "50000-100000")
                ]
            )
        , Layer.fillAntialias true
        , Layer.fillOpacity
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0 ), ( 9, float 0.30000000000000004 ), ( 14, float 0.30000000000000004 ), ( 15, float 0 ) ]
            )
        , Layer.fillColor (E.rgba 171 171 171 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "settlement_more_100000"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement"
        , Layer.minzoom 7
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "more_100000")
                ]
            )
        , Layer.fillAntialias true
        , Layer.fillOpacity
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 7, float 0 ), ( 8, float 0.30000000000000004 ), ( 14, float 0.30000000000000004 ), ( 15, float 0 ) ]
            )
        , Layer.fillColor (E.rgba 171 171 171 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "landcover_glacier"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landcover"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "glacier"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 0 ), ( 12, float 1 ) ])
        , Layer.fillColor (E.rgba 220 240 245 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "landcover_woodland"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landcover"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "woodland"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 0 ), ( 12, float 1 ) ])
        , Layer.fillColor (E.rgba 220 230 220 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "landuse_leisure"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "park", true ), ( "green_area", true ) ] false)
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 225 235 205 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "landuse_cemetery"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "cemetery"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 225 235 205 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "landuse_hospital"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landuse"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "hospital_site"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 240 240 245 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "hydrology_watercourse_underground"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-ln"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "watercourse_underground"))
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
    , Layer.line "roadtraffic_class4_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "track", true ), ( "autotrain", true ), ( "via_ferrata", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_contour_class3_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_class3_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_contour_class2_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_class2_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_contour_class1_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_class1_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "roadtraffic_contour_highway_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12.5, float 0 ), ( 13.5, float 1 ) ])
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13.5, float 0.5 ), ( 18, float 1.5 ) ])
        , Layer.lineGapWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 3 ), ( 12, float 4 ), ( 14, float 6 ), ( 16, float 10 ), ( 18, float 30 ) ]
            )
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineDasharray (E.floats [ 5, 5 ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_highway_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
                ]
            )
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 9, float 1 ), ( 13, float 0.7000000000000001 ) ])
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "railtraffic_side_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "railtraffic_tunnel"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.isEqual (str "tunnel")
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
    , Layer.line "hydrology_watercourse"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-ln"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "watercourse"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.lineColor (E.rgba 205 220 230 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13, float 2 ), ( 18, float 7 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "hydrology_water_basin"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-pn"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "water_basin"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (float 1)
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "hydrology_river"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-pn"
        , Layer.minzoom 8
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "river"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0 ), ( 8.5, float 1 ) ])
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.fill "hydrology_lake"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-pn"
        , Layer.minzoom 6
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "lake"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (float 1)
        , Layer.fillColor (E.rgba 205 220 230 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "ferryservice_passenger_ferry"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "ferryservice"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "passenger_ferry"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 0 ), ( 13.5, float 0.4 ) ])
        , Layer.lineColor (E.rgba 61 168 245 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 1 ), ( 18, float 4 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "ferryservice_car_ferry"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "ferryservice"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "car_ferry"))
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
    , Layer.line "roadtraffic_contour_traffic-area"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "trafficarea"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "traffic_area"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 13, float 2 ), ( 18, float 4 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "airtraffic_runway_contour"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "airtraffic"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "runway"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0.5 ), ( 12, float 2 ), ( 18, float 4 ) ])
        , Layer.lineCap E.butt
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_contour_class3"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "roadtraffic_contour_class2"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "roadtraffic_contour_class1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.fill "roadtraffic_traffic-area"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "trafficarea"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "traffic_area"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 12, float 0 ), ( 12.5, float 1 ) ])
        , Layer.fillColor (E.rgba 252 252 252 1)
        , Layer.fillOutlineColor (E.rgba 252 252 252 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_contour_highway"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2,", false ), ( "3", false ), ( "4", false ) ] true
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_class4"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "track", true ), ( "autotrain", true ), ( "via_ferrata", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "roadtraffic_class3"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "roadtraffic_class2"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.fill "airtraffic_runway"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "airtraffic"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "runway"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 11.5, float 1 ) ])
        , Layer.fillColor (E.rgba 252 252 252 1)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_class1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "roadtraffic_highway"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2,", false ), ( "3", false ), ( "4", false ) ] true
                ]
            )
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "railtraffic_side"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.line "railtraffic_"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level")
                    |> E.matchesStr [ ( "1", false ), ( "2,", false ), ( "3", false ), ( "4", false ) ] true
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
    , Layer.fill "buildings_"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "building"
        , Layer.minzoom 14
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "building"))
        , Layer.fillAntialias true
        , Layer.fillOpacity (float 1)
        , Layer.fillColor (E.zoom |> E.interpolate (E.Exponential 1) [ ( 14, E.rgba 225 225 225 1 ), ( 15, E.rgba 204 204 204 1 ) ])

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_contour_class3_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_contour_class2_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_contour_class1_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_contour_highway_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_class4_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "track", true ), ( "autotrain", true ), ( "via_ferrata", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_class3_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_class2_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_class1_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_highway_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
                ]
            )
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "railtraffic_side_contour_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "railtraffic_contour_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "railtraffic_side_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "railtraffic_level1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.isEqual (str "1")
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
    , Layer.line "roadtraffic_contour_class3_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_contour_class2_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_contour_class1_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_contour_highway_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
                ]
            )
        , Layer.lineColor (E.rgba 185 175 170 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 11, float 0 ), ( 13.5, float 5 ), ( 18, float 33 ) ])
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.butt
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "roadtraffic_class4_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "track", true ), ( "autotrain", true ), ( "via_ferrata", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_class3_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "small_road")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_class2_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "road", true ), ( "drive", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_class1_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "trunk_road", true ), ( "main_connecting_road", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "roadtraffic_highway_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "roadtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "highway", true ), ( "expressway", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
                ]
            )
        , Layer.lineColor (E.rgba 250 230 200 1)
        , Layer.lineWidth
            (E.zoom
                |> E.interpolate (E.Exponential 1.8) [ ( 9, float 0 ), ( 9.5, float 3 ), ( 13.5, float 4 ), ( 18, float 30 ) ]
            )
        , Layer.lineOffset
            (E.zoom
                |> E.interpolate (E.Exponential 1.99) [ ( 12, float 1 ), ( 15, float 5 ), ( 17, float 9 ), ( 18, float 13 ), ( 20, float 10 ) ]
            )
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.bevel
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "railtraffic_side_contour_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "railtraffic_contour_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "railtraffic_side_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "tram")
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "railtraffic_level>1"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "railtraffic"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class")
                    |> E.matchesStr [ ( "normal_gauge", true ), ( "narrow_gauge", true ), ( "side_track", true ) ] false
                , E.getProperty (str "subclass") |> E.notEqual (str "tunnel")
                , E.getProperty (str "level") |> E.matchesStr [ ( "2", true ), ( "3", true ), ( "4", true ) ] false
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
    , Layer.line "aerialways_"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "aerialway"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr [ ( "gondola_lift", true ), ( "aerial_tramway", true ), ( "chair_lift", true ), ( "drag_lift", true ) ] false
            )
        , Layer.lineOpacity (float 1)
        , Layer.lineColor (E.rgba 255 143 130 1)
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 8, float 0.5 ), ( 15, float 0.75 ), ( 18, float 2 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.line "boundary_"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "boundary"
        , Layer.minzoom 5
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "national_border"))
        , Layer.lineOpacity (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 10, float 1 ), ( 12, float 0.30000000000000004 ) ])
        , Layer.lineColor (E.zoom |> E.interpolate (E.Exponential 1) [ ( 10, E.rgba 230 215 230 1 ), ( 12, E.rgba 230 175 230 1 ) ])
        , Layer.lineWidth (E.zoom |> E.interpolate (E.Exponential 1.8) [ ( 6, float 2 ), ( 12, float 6 ), ( 18, float 40 ) ])
        , Layer.lineCap E.rounded
        , Layer.lineJoin E.rounded
        , Layer.lineMiterLimit (float 2)
        , Layer.lineRoundLimit (float 1.05)

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_peaks"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "peak-name"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr
                    [ ( "rock", true )
                    , ( "peak", true )
                    , ( "main_peak", true )
                    , ( "main_hill", true )
                    , ( "hill", true )
                    , ( "mountain_pass", true )
                    , ( "pass_crossing", true )

                    --, ( "pass_crossing", true )
                    ]
                    false
            )
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 8, float 0.15 ), ( 14, float 0.2 ) ])
        , Layer.iconImage (str "peak")
        , Layer.iconPadding (float 2)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 13 ), ( 20, float 20 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 35)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, -0.2 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_mountain_pass"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "peak-name"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "mountain_pass"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 13 ), ( 20, float 20 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 35)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_alpine_peaks"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "peak-name"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "alpine_peak"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 8, float 0.15 ), ( 14, float 0.2 ) ])
        , Layer.iconImage (str "peak")
        , Layer.iconPadding (float 2)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 15 ), ( 20, float 30 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 50)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, -0.2 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_green-areas"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landuse-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "cemetery", true ), ( "park", true ) ] false)
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 87 166 38 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_leisure"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "leisure-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr
                    [ ( "camp_site", true )
                    , ( "zoo", true )
                    , ( "golf_course_site", true )
                    , ( "allotment_site", true )
                    , ( "swimming_pool_site", true )
                    , ( "sports_sites", true )
                    ]
                    false
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 87 166 38 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_poi"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "leisure-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr [ ( "leisure_facility_site", true ), ( "racecourse_site", true ) ] false
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 175 110 70 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 1)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_streetnames_street"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "streetnames-axis"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr [ ( "street", true ), ( "square", true ), ( "named_area", true ) ] false
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0)
        , Layer.symbolPlacement E.line
        , Layer.textRotationAlignment E.map
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11 ), ( 20, float 14 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.02)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 30)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_island"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-pt-name"
        , Layer.minzoom 6
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "island"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 10, float 11 ), ( 18, float 16 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_lakes"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-pt-name"
        , Layer.minzoom 6
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "lake"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 61 168 245 1)
        , Layer.textHaloColor (E.rgba 205 220 230 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 2)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Italic" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 10, float 12 ), ( 18, float 19 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.25)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_watercourse"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "hydrology-ln-name"
        , Layer.minzoom 13
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "watercourse"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 61 168 245 1)
        , Layer.textHaloColor (E.rgba 205 220 230 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 2)
        , Layer.symbolPlacement E.line
        , Layer.symbolSpacing (float 250)
        , Layer.textRotationAlignment E.map
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
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
    , Layer.symbol "labels_station_aerialway"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "publictransport-stop"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "aerialway"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 255 71 51 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 0.15 ), ( 18, float 0.2 ) ])
        , Layer.iconImage (str "pointheavyred")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11 ), ( 18, float 14 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 1)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0.5 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_station_ferry"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "publictransport-stop"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "ferry"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 61 168 245 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.8)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 0.15 ), ( 18, float 0.2 ) ])
        , Layer.iconImage (str "pointheavyblue")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.06000000000000001)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0.5 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_station_bus"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "publictransport-stop"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "bus"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 255 143 130 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 0.15 ), ( 18, float 0.2 ) ])
        , Layer.iconImage (str "pointheavyred")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 1)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0.5 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_station_tram"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "publictransport-stop"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "tram", true ), ( "funicular", true ) ] false)
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 255 71 51 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.8)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 0.15 ), ( 18, float 0.2 ) ])
        , Layer.iconImage (str "pointheavyred")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 11.5 ), ( 18, float 15 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.06000000000000001)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0.5 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_station_railway"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "publictransport-stop"
        , Layer.minzoom 14
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr [ ( "railway", true ), ( "subway", true ), ( "cog_railway", true ), ( "interchange", true ) ] false
            )
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 255 71 51 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.8)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 0.15 ), ( 18, float 0.2 ) ])
        , Layer.iconImage (str "pointheavyred")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 15, float 12 ), ( 18, float 17 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.06000000000000001)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0.5 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_buildings"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "building-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr
                    [ ( "lookout_tower", true )
                    , ( "remote_inn", true )
                    , ( "wilderness_hut", true )
                    , ( "gym", true )
                    , ( "stadium", true )
                    , ( "observatory", true )
                    , ( "chapel", true )
                    , ( "sacred_building", true )
                    , ( "historic_building", true )
                    ]
                    false
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 16, float 12 ), ( 20, float 20 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 1)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 1 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_hospital_site"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "landuse-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "hospital_site"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 102 255 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap true
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (float 0.4)
        , Layer.iconImage (str "hospital")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 16, float 12 ), ( 20, float 20 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.top
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 1)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 1 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_less_20"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "less_20")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 16, float 15 ), ( 22, float 19 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_25-49"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "25-49")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 14, float 15 ), ( 15, float 17 ), ( 22, float 21 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_50-99"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 14
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "50-99")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 12, float 13 ), ( 15, float 19 ), ( 20, float 23 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_100-999"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "100-999")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 12 ), ( 15, float 19.5 ), ( 18, float 25 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_1000-1999"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "1000-1999")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 9, float 11 ), ( 15, float 20 ), ( 18, float 27 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_2000-9999"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "2000-9999")
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 8, float 12.5 ), ( 15, float 20.5 ), ( 16, float 29 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_airport"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "airtraffic-name"
        , Layer.minzoom 10
        , Layer.maxzoom 16
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "airport"))
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 0.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 11, float 0.4 ), ( 14, float 0.8 ) ])
        , Layer.iconImage (str "airport")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 10, float 12 ), ( 16, float 27 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.1)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.left
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0.8, 0.2 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_10000-499999"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 8
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "10000-49999")
                ]
            )
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize
            (E.zoom
                |> E.interpolate (E.Exponential 1) [ ( 8, float 0.15 ), ( 10, float 0.17500000000000002 ), ( 10.5, float 0 ) ]
            )
        , Layer.iconImage (str "donut85black")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 7, float 12 ), ( 14, float 21 ), ( 15, float 31 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_50000-100000"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 7
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "50000-100000")
                ]
            )
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 77 77 77 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize
            (E.zoom
                |> E.interpolate (E.Exponential 1) [ ( 8, float 0.17500000000000002 ), ( 10, float 0.2 ), ( 10.5, float 0 ) ]
            )
        , Layer.iconImage (str "donut85black")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 7, float 14 ), ( 14, float 22 ), ( 15, float 33 ) ])
        , Layer.textMaxWidth (float 5)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    , Layer.symbol "labels_settlement_more-100000"
        "Leichte Basiskarte"
        [ Layer.sourceLayer "settlement-name"
        , Layer.minzoom 6
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "locality")
                , E.getProperty (str "subclass") |> E.isEqual (str "more_100000")
                ]
            )
        , Layer.iconOpacity (float 1)
        , Layer.iconTranslateAnchor E.viewport
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 38 38 38 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.5)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.iconAllowOverlap false
        , Layer.iconRotationAlignment E.viewport
        , Layer.iconSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 8, float 0.2 ), ( 10, float 0.225 ), ( 10.5, float 0 ) ])
        , Layer.iconImage (str "donut85black")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 6, float 14 ), ( 14, float 25 ), ( 15, float 35 ) ])
        , Layer.textMaxWidth (float 5)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0.01)
        , Layer.textJustify E.center
        , Layer.textAnchor E.bottom
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.none
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    ]
