module LoadJson.Html exposing (simpleViewForm)

import Html exposing (Html, div, fieldset, legend, label, input, button, br, text)
import Html.Attributes exposing (maxlength)
import Html.Events exposing (onClick, onInput)
import LoadJson.Model exposing (Model)
import LoadJson.Update exposing (..)


simpleViewForm : Model -> Html Msg
simpleViewForm model =
    div []
        [ fieldset []
            [ legend [] [ text "Busca Endereço" ]
            , div []
                [ label [] [ text "Digite o cep:" ]
                , br [] []
                , input [ onInput UpdateSearchCep, maxlength 9 ] []
                , label [] [ text ("CEP usado na consulta:" ++ model.search.cep) ]
                , br [] []
                , button [ onClick SearchAddress ] [ text "Buscar" ]
                , br [] []
                , text ("Resultado: " ++ (toString model.address))
                ]
            ]
        ]
