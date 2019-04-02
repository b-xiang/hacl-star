module GCMdecrypt_stdcalls

open X64.CPU_Features_s
open FStar.HyperStack.ST
module B = LowStar.Buffer
module HS = FStar.HyperStack
module DV = LowStar.BufferView.Down
module UV = LowStar.BufferView.Up
open FStar.Mul
open Types_s
open Words_s
open Words.Seq_s
open GCM_helpers
open AES_s
open GCM_s
open Interop.Base
open Arch.Types

let uint8_p = B.buffer UInt8.t
let uint64 = UInt64.t

let length_aux (b:uint8_p) : Lemma
  (requires B.length b = 176)
  (ensures DV.length (get_downview b) % 16 = 0) = 
    let db = get_downview b in
    DV.length_eq db

let length_aux2 (b:uint8_p) : Lemma
  (requires B.length b = 240)
  (ensures DV.length (get_downview b) % 16 = 0) = 
    let db = get_downview b in
    DV.length_eq db

inline_for_extraction
val gcm128_decrypt_stdcall:
  key:Ghost.erased (Seq.seq nat32) ->
  cipher_b:uint8_p ->
  cipher_num:uint64 ->
  auth_b:uint8_p ->
  auth_num:uint64 ->
  iv_b:uint8_p ->
  out_b:uint8_p ->
  tag_b:uint8_p ->
  keys_b:uint8_p ->
  Stack UInt64.t 
    (requires fun h0 ->
      B.disjoint cipher_b out_b /\ B.disjoint auth_b out_b /\
      B.disjoint keys_b out_b /\ B.disjoint tag_b out_b /\

      (B.disjoint cipher_b auth_b \/ cipher_b == auth_b) /\
      (B.disjoint cipher_b iv_b \/ cipher_b == iv_b) /\
      (B.disjoint cipher_b tag_b \/ cipher_b == tag_b) /\
      (B.disjoint cipher_b keys_b \/ cipher_b == keys_b) /\
      (B.disjoint auth_b iv_b \/ auth_b == iv_b) /\      
      (B.disjoint auth_b tag_b \/ auth_b == tag_b) /\
      (B.disjoint auth_b keys_b \/ auth_b == keys_b) /\
      (B.disjoint iv_b out_b \/ iv_b == out_b) /\      
      (B.disjoint iv_b tag_b \/ iv_b == tag_b) /\
      (B.disjoint iv_b keys_b \/ iv_b == keys_b) /\     
      (B.disjoint tag_b keys_b \/ tag_b == keys_b) /\     
      
      B.live h0 keys_b /\ B.live h0 cipher_b /\ B.live h0 iv_b /\ 
      B.live h0 out_b /\ B.live h0 tag_b /\ B.live h0 auth_b /\

      UInt64.v cipher_num % 16 = 0 /\
      UInt64.v auth_num % 16 = 0 /\

      B.length cipher_b = UInt64.v cipher_num /\
      B.length auth_b = UInt64.v auth_num /\
      B.length iv_b = 16 /\
      B.length out_b = B.length cipher_b /\
      B.length tag_b = 16 /\
      B.length keys_b = 176 /\

      4096 * (UInt64.v cipher_num) < pow2_32 /\
      4096 * (UInt64.v auth_num) < pow2_32 /\
      
      aesni_enabled /\ pclmulqdq_enabled /\
      is_aes_key_LE AES_128 (Ghost.reveal key) /\
      (Seq.equal (B.as_seq h0 keys_b)
        (seq_nat8_to_seq_uint8 (le_seq_quad32_to_bytes (key_to_round_keys_LE AES_128 (Ghost.reveal key)))))
    )
    (ensures fun h0 r h1 ->
      B.modifies (B.loc_buffer out_b) h0 h1 /\

      (let iv = seq_uint8_to_seq_nat8 (B.as_seq h0 iv_b) in
       let cipher = seq_uint8_to_seq_nat8 (B.as_seq h0 cipher_b) in
       let auth = seq_uint8_to_seq_nat8 (B.as_seq h0 auth_b) in
       let tag = seq_uint8_to_seq_nat8 (B.as_seq h0 tag_b) in
       let plain, result = gcm_decrypt_LE AES_128 (seq_nat32_to_seq_nat8_LE (Ghost.reveal key)) iv cipher auth tag in
       Seq.equal (seq_uint8_to_seq_nat8 (B.as_seq h1 out_b)) plain /\
       (UInt64.v r = 0) == result)
    )

inline_for_extraction
val gcm256_decrypt_stdcall:
  key:Ghost.erased (Seq.seq nat32) ->
  cipher_b:uint8_p ->
  cipher_num:uint64 ->
  auth_b:uint8_p ->
  auth_num:uint64 ->
  iv_b:uint8_p ->
  out_b:uint8_p ->
  tag_b:uint8_p ->
  keys_b:uint8_p ->
  Stack UInt64.t
    (requires fun h0 ->
      B.disjoint cipher_b out_b /\ B.disjoint auth_b out_b /\
      B.disjoint keys_b out_b /\ B.disjoint tag_b out_b /\

      (B.disjoint cipher_b auth_b \/ cipher_b == auth_b) /\
      (B.disjoint cipher_b iv_b \/ cipher_b == iv_b) /\
      (B.disjoint cipher_b tag_b \/ cipher_b == tag_b) /\
      (B.disjoint cipher_b keys_b \/ cipher_b == keys_b) /\
      (B.disjoint auth_b iv_b \/ auth_b == iv_b) /\      
      (B.disjoint auth_b tag_b \/ auth_b == tag_b) /\
      (B.disjoint auth_b keys_b \/ auth_b == keys_b) /\
      (B.disjoint iv_b out_b \/ iv_b == out_b) /\      
      (B.disjoint iv_b tag_b \/ iv_b == tag_b) /\
      (B.disjoint iv_b keys_b \/ iv_b == keys_b) /\     
      (B.disjoint tag_b keys_b \/ tag_b == keys_b) /\     
      
      B.live h0 keys_b /\ B.live h0 cipher_b /\ B.live h0 iv_b /\ 
      B.live h0 out_b /\ B.live h0 tag_b /\ B.live h0 auth_b /\

      UInt64.v cipher_num % 16 = 0 /\
      UInt64.v auth_num % 16 = 0 /\

      B.length cipher_b = UInt64.v cipher_num /\
      B.length auth_b = UInt64.v auth_num /\
      B.length iv_b = 16 /\
      B.length out_b = B.length cipher_b /\
      B.length tag_b = 16 /\
      B.length keys_b = 240 /\

      4096 * (UInt64.v cipher_num) < pow2_32 /\
      4096 * (UInt64.v auth_num) < pow2_32 /\
      
      aesni_enabled /\ pclmulqdq_enabled /\
      is_aes_key_LE AES_256 (Ghost.reveal key) /\
      (Seq.equal (B.as_seq h0 keys_b)
        (seq_nat8_to_seq_uint8 (le_seq_quad32_to_bytes (key_to_round_keys_LE AES_256 (Ghost.reveal key)))))
    )
    (ensures fun h0 r h1 ->
      B.modifies (B.loc_buffer out_b) h0 h1 /\

      (let iv = seq_uint8_to_seq_nat8 (B.as_seq h0 iv_b) in
       let cipher = seq_uint8_to_seq_nat8 (B.as_seq h0 cipher_b) in
       let auth = seq_uint8_to_seq_nat8 (B.as_seq h0 auth_b) in
       let tag = seq_uint8_to_seq_nat8 (B.as_seq h0 tag_b) in
       let plain, result = gcm_decrypt_LE AES_256 (seq_nat32_to_seq_nat8_LE (Ghost.reveal key)) iv cipher auth tag in
       Seq.equal (seq_uint8_to_seq_nat8 (B.as_seq h1 out_b)) plain /\
       (UInt64.v r = 0) == result)
    )