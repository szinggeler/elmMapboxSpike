module Styles.SwisstopoOpenMapTilesLayers exposing (lyrs)

import LngLat as LngLat
import Mapbox.Expression as E exposing (false, float, str, true)
import Mapbox.Layer as Layer
import Mapbox.Source as Source
import Mapbox.Style as Style exposing (Style(..))


lyrs =
    [ Layer.symbol "osm_labels_peaks"
        "OpenMapTiles"
        [ Layer.sourceLayer "mountain_peak"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "ele") |> E.lessThan (float 3000))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_alpine_peaks"
        "OpenMapTiles"
        [ Layer.sourceLayer "mountain_peak"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "ele") |> E.greaterThanOrEqual (float 3000))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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

    {-
       , Layer.symbol "osm_labels_green-areas"
           "OpenMapTiles"
           [ Layer.sourceLayer "poi"
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
           , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    -}
    , Layer.symbol "osm_labels_leisure"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr
                    [ ( "campsite", true )
                    , ( "camp_site", true )
                    , ( "zoo", true )
                    , ( "golf", true )
                    , ( "golf_course", true )
                    , ( "swimming_area", true )
                    , ( "swimming_pool", true )
                    , ( "water_park", true )
                    , ( "horse_racing", true )
                    , ( "sports_centre", true )
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_poi"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.matchesStr [ ( "museum", true ), ( "art_gallery", true ) ] false)
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
    , Layer.symbol "osm_labels_streetnames_street"
        "OpenMapTiles"
        [ Layer.sourceLayer "transportation_name"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.all [])
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 2)
        , Layer.textHaloBlur (float 0)
        , Layer.symbolPlacement E.line
        , Layer.textRotationAlignment E.map
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_island"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_lakes"
        "OpenMapTiles"
        [ Layer.sourceLayer "water_name"
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_station_aerialway"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "station"))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_station_ferry"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "ferry_terminal"))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_station_bus"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_station_tram"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "railway")
                , E.getProperty (str "subclass") |> E.isEqual (str "tram_stop")
                ]
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_station_railway"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "railway")
                , E.getProperty (str "subclass") |> E.notEqual (str "tram_stop")
                ]
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_buildings"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter
            (E.getProperty (str "class")
                |> E.matchesStr [ ( "attraction", true ), ( "monument", true ), ( "stadium", true ), ( "place_of_worship", true ) ] false
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
    , Layer.symbol "osm_labels_hospital_site"
        "OpenMapTiles"
        [ Layer.sourceLayer "poi"
        , Layer.minzoom 15
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "hospital"))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_less_100"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 14
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "hamlet"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_100-999"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 12
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "village", true ), ( "suburb", true ) ] false
                , E.getProperty (str "rank")
                    |> E.matchesFloat [ ( 14, true ), ( 15, true ), ( 16, true ), ( 17, true ), ( 18, true ), ( 19, true ), ( 20, true ) ] false
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_1000-1999"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 11
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "village", true ), ( "suburb", true ) ] false
                , E.getProperty (str "rank") |> E.isEqual (float 13)
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_2000-9999"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 9
        , Layer.maxzoom 22
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.matchesStr [ ( "village", true ), ( "suburb", true ) ] false
                , E.getProperty (str "rank")
                    |> E.matchesFloat [ ( 8, true ), ( 9, true ), ( 10, true ), ( 11, true ), ( 12, true ) ] false
                ]
            )
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 128 128 128 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.25)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_airport"
        "OpenMapTiles"
        [ Layer.sourceLayer "aerodrome_label"
        , Layer.minzoom 10
        , Layer.maxzoom 22
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "international"))
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_10000-499999"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 8
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "town")
                , E.getProperty (str "rank")
                    |> E.matchesFloat
                        [ ( 11, true )
                        , ( 12, true )
                        , ( 13, true )
                        , ( 14, true )
                        , ( 15, true )
                        , ( 16, true )
                        , ( 17, true )
                        , ( 18, true )
                        , ( 19, true )
                        , ( 20, true )
                        ]
                        false
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_50000-100000"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 7
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "town")
                , E.getProperty (str "rank") |> E.matchesFloat [ ( 8, true ), ( 9, true ), ( 10, true ) ] false
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 7, float 14 ), ( 14, float 22 ), ( 15, float 33 ) ])
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
    , Layer.symbol "osm_labels_settlement_more-100000"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 6
        , Layer.maxzoom 15
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "city")
                , E.getProperty (str "rank")
                    |> E.matchesFloat [ ( 6, true ), ( 7, true ), ( 8, true ), ( 9, true ), ( 10, true ), ( 11, true ), ( 12, true ) ] false
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
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
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
    , Layer.symbol "osm_labels_settlement_big_city"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 5
        , Layer.maxzoom 14
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "city")
                , E.getProperty (str "rank") |> E.matchesFloat [ ( 4, true ), ( 5, true ) ] false
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
        , Layer.iconSize
            (E.zoom
                |> E.interpolate (E.Exponential 1) [ ( 5, float 0.17500000000000002 ), ( 8, float 0.225 ), ( 10, float 0.25 ), ( 10.5, float 0 ) ]
            )
        , Layer.iconImage (str "donut85black")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 6, float 15 ), ( 14, float 30 ), ( 15, float 40 ) ])
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
    , Layer.symbol "osm_labels_settlement_metropolis"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 4
        , Layer.maxzoom 13
        , Layer.filter
            (E.all
                [ E.getProperty (str "class") |> E.isEqual (str "city")
                , E.getProperty (str "rank") |> E.matchesFloat [ ( 1, true ), ( 2, true ), ( 3, true ) ] false
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
        , Layer.iconSize
            (E.zoom
                |> E.interpolate (E.Exponential 1) [ ( 5, float 0.2 ), ( 8, float 0.25 ), ( 10, float 0.275 ), ( 10.5, float 0 ) ]
            )
        , Layer.iconImage (str "donut85black")
        , Layer.iconPadding (float 0)
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
        , Layer.textFont (E.strings [ "Roboto Regular" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 6, float 16 ), ( 14, float 35 ), ( 15, float 45 ) ])
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
    , Layer.symbol "osm_labels_settlement_country"
        "OpenMapTiles"
        [ Layer.sourceLayer "place"
        , Layer.minzoom 1
        , Layer.maxzoom 7
        , Layer.filter (E.getProperty (str "class") |> E.isEqual (str "country"))
        , Layer.textOpacity (float 1)
        , Layer.textColor (E.rgba 38 38 38 1)
        , Layer.textHaloColor (E.rgba 245 245 245 1)
        , Layer.textHaloWidth (float 1.75)
        , Layer.textHaloBlur (float 0.5)
        , Layer.symbolPlacement E.point
        , Layer.textRotationAlignment E.viewport
        , Layer.textField (E.toFormattedText (E.getProperty (str "name:latin")))
        , Layer.textFont (E.strings [ "Roboto Condensed Bold" ])
        , Layer.textSize (E.zoom |> E.interpolate (E.Exponential 1) [ ( 1, float 12 ), ( 6, float 18 ) ])
        , Layer.textMaxWidth (float 10)
        , Layer.textLineHeight (float 1.2)
        , Layer.textLetterSpacing (float 0)
        , Layer.textJustify E.center
        , Layer.textAnchor E.center
        , Layer.textMaxAngle (float 45)
        , Layer.textRotate (float 0)
        , Layer.textPadding (float 2)
        , Layer.textKeepUpright true
        , Layer.textTransform E.uppercase
        , Layer.textOffset (E.floats [ 0, 0 ])
        , Layer.textAllowOverlap false

        --, Layer.visibility (str "visible")
        ]
    ]
