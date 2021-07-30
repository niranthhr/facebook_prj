(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

(* TODO: Add other types as they are needed by translation (otherwise it's dead code). *)
type t = Any | Cons | Nil | Tuple of int [@@deriving compare, yojson_of]

let pp f = function
  | Any ->
      Format.fprintf f "ErlangAny"
  | Nil ->
      Format.fprintf f "ErlangNil"
  | Cons ->
      Format.fprintf f "ErlangCons"
  | Tuple arity ->
      Format.fprintf f "ErlangTuple%d" arity


let to_string name = Format.asprintf "%a" pp name

let cons_head = "head"

let cons_tail = "tail"

let tuple_field_names size = List.init size ~f:(Printf.sprintf "elem%d")
