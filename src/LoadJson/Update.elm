module LoadJson.Update exposing (..)

import Http
import LoadJson.Model exposing (Search, Address)


type Msg
    = SearchAddress
    | SendRequest
    | UpdateSearchCep String
    | LoadAddress (Result Http.Error Address)


updateSearchCep : Search -> String -> Search
updateSearchCep search newValue =
    { search | cep = newValue }
