module Main exposing (..)

import Browser
import Html exposing (Html)
import Html.Attributes as Html
import Html.Events as Html


type alias Model =
    { animation : Bool }


type Msg
    = NoOp
    | Toggle Bool


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( { animation = True }, Cmd.none )
        , view =
            \model ->
                { title = "elm-vite template"
                , body =
                    [ Html.div [ Html.class "wrapper" ]
                        [ Html.h1 [ Html.class "title" ] [ Html.text "elm-vite template" ]
                        , Html.div [ Html.classList [ ( "lambda", True ), ( "animation", model.animation ) ] ] [ Html.text "λ" ]
                        , Html.button
                            [ Html.onClick (Toggle (not model.animation)) ]
                            [ Html.text
                                (if model.animation then
                                    "pause"

                                 else
                                    "play"
                                )
                            ]
                        ]
                    ]
                }
        , update =
            \msg model ->
                case msg of
                    Toggle animation ->
                        ( { animation = animation }, Cmd.none )

                    _ ->
                        ( model, Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
