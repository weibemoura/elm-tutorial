module LoadJson exposing (main)

import Html exposing (Html)
import Http exposing (..)
import Update.Extra exposing (andThen)
import LoadJson.Model exposing (Model, Search, Address, createEmptyAddress)
import LoadJson.Update exposing (..)
import LoadJson.Html exposing (simpleViewForm)
import LoadJson.Decode exposing (decodeAddress)


main : Program Never Model Msg
main =
    Html.program { init = ( init, Cmd.none ), view = view, update = update, subscriptions = always Sub.none }


init : Model
init =
    { search = Search "", address = createEmptyAddress }


view : Model -> Html Msg
view model =
    simpleViewForm model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchAddress ->
            -- (model)
            --     |> update SendRequest
            -- ( model
            -- , Task.succeed SendRequest
            --     |> Task.perform identity
            -- )
            (model
                ! []
                |> andThen update SendRequest
                |> andThen update SendRequest
            )

        SendRequest ->
            let
                url =
                    "https://viacep.com.br/ws/" ++ model.search.cep ++ "/json/"

                request =
                    (Http.get url decodeAddress)
            in
                ( model, (Http.send LoadAddress request) )

        UpdateSearchCep newValue ->
            let
                search =
                    (updateSearchCep model.search newValue)
            in
                ( { model | search = search }, Cmd.none )

        LoadAddress (Ok result) ->
            ( { model | address = result }, Cmd.none )

        LoadAddress (Err err) ->
            ( model, Cmd.none )
