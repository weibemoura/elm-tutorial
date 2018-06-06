module LoadJson.Decode exposing (decodeAddress)

import Json.Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (decode, required)
import LoadJson.Model exposing (Address)


decodeAddress : Decoder Address
decodeAddress =
    decode Address
        |> required "cep" string
        |> required "logradouro" string
        |> required "complemento" string
        |> required "bairro" string
        |> required "localidade" string
        |> required "uf" string
        |> required "unidade" string
        |> required "ibge" string



{--
decodeAddress : Decoder Address
decodeAddress =
    Json.Decode.map8 Address
        (field "cep" string)
        (field "logradouro" string)
        (field "complemento" string)
        (field "bairro" string)
        (field "localidade" string)
        (field "uf" string)
        (field "unidade" string)
        (field "ibge" string)
--}
