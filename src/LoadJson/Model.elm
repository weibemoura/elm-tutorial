module LoadJson.Model exposing (Model, Search, Address, createEmptyAddress)


type alias Search =
    { cep : String }


type alias Address =
    { cep : String
    , logradouro : String
    , complemento : String
    , bairro : String
    , localidade : String
    , uf : String
    , unidade : String
    , ibge : String
    }


type alias Model =
    { search : Search, address : Address }


createEmptyAddress : Address
createEmptyAddress =
    Address "" "" "" "" "" "" "" ""
