module Simple exposing (main)

import Html exposing (Html)
import Simple.Model exposing (Model)
import Simple.Update exposing (..)
import Simple.Html exposing (simpleViewCount)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


model : Model
model =
    { count = 0 }


view : Model -> Html Msg
view model =
    simpleViewCount model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            incrementCount model

        Decrement ->
            decrementCount model
