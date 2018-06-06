module Simple.Html exposing (simpleViewCount)

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Simple.Model exposing (Model)
import Simple.Update exposing (..)


simpleViewCount : Model -> Html Msg
simpleViewCount model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (" Value " ++ (toString model.count) ++ " ")
        , button [ onClick Increment ] [ text "+" ]
        ]
