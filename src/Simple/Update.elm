module Simple.Update exposing (..)

import Simple.Model exposing (Model)


type Msg
    = Increment
    | Decrement


incrementCount : Model -> Model
incrementCount model =
    { model | count = model.count + 1 }


decrementCount : Model -> Model
decrementCount model =
    if model.count == 0 then
        { model | count = 0 }
    else
        { model | count = model.count - 1 }
