module Spec.AES256.Test

open Lib.IntTypes
open Lib.RawIntTypes
open Lib.Sequence
open Spec.AES256
open Lib.LoopCombinators

let test_expansion_key1 = List.Tot.map u8 [
  0x60; 0x3d; 0xeb; 0x10; 0x15; 0xca; 0x71; 0xbe;
  0x2b; 0x73; 0xae; 0xf0; 0x85; 0x7d; 0x77; 0x81;
  0x1f; 0x35; 0x2c; 0x07; 0x3b; 0x61; 0x08; 0xd7;
  0x2d; 0x98; 0x10; 0xa3; 0x09; 0x14; 0xdf; 0xf4
]

let test_expansion_expanded1 = List.Tot.map u8 [
  0x9b; 0xa3; 0x54; 0x11;
  0x8e; 0x69; 0x25; 0xaf;
  0xa5; 0x1a; 0x8b; 0x5f;
  0x20; 0x67; 0xfc; 0xde;
  0xa8; 0xb0; 0x9c; 0x1a;
  0x93; 0xd1; 0x94; 0xcd;
  0xbe; 0x49; 0x84; 0x6e;
  0xb7; 0x5d; 0x5b; 0x9a;
  0xd5; 0x9a; 0xec; 0xb8;
  0x5b; 0xf3; 0xc9; 0x17;
  0xfe; 0xe9; 0x42; 0x48;
  0xde; 0x8e; 0xbe; 0x96;
  0xb5; 0xa9; 0x32; 0x8a;
  0x26; 0x78; 0xa6; 0x47;
  0x98; 0x31; 0x22; 0x29;
  0x2f; 0x6c; 0x79; 0xb3;
  0x81; 0x2c; 0x81; 0xad;
  0xda; 0xdf; 0x48; 0xba;
  0x24; 0x36; 0x0a; 0xf2;
  0xfa; 0xb8; 0xb4; 0x64;
  0x98; 0xc5; 0xbf; 0xc9;
  0xbe; 0xbd; 0x19; 0x8e;
  0x26; 0x8c; 0x3b; 0xa7;
  0x09; 0xe0; 0x42; 0x14;
  0x68; 0x00; 0x7b; 0xac;
  0xb2; 0xdf; 0x33; 0x16;
  0x96; 0xe9; 0x39; 0xe4;
  0x6c; 0x51; 0x8d; 0x80;
  0xc8; 0x14; 0xe2; 0x04;
  0x76; 0xa9; 0xfb; 0x8a;
  0x50; 0x25; 0xc0; 0x2d;
  0x59; 0xc5; 0x82; 0x39;
  0xde; 0x13; 0x69; 0x67;
  0x6c; 0xcc; 0x5a; 0x71;
  0xfa; 0x25; 0x63; 0x95;
  0x96; 0x74; 0xee; 0x15;
  0x58; 0x86; 0xca; 0x5d;
  0x2e; 0x2f; 0x31; 0xd7;
  0x7e; 0x0a; 0xf1; 0xfa;
  0x27; 0xcf; 0x73; 0xc3;
  0x74; 0x9c; 0x47; 0xab;
  0x18; 0x50; 0x1d; 0xda;
  0xe2; 0x75; 0x7e; 0x4f;
  0x74; 0x01; 0x90; 0x5a;
  0xca; 0xfa; 0xaa; 0xe3;
  0xe4; 0xd5; 0x9b; 0x34;
  0x9a; 0xdf; 0x6a; 0xce;
  0xbd; 0x10; 0x19; 0x0d;
  0xfe; 0x48; 0x90; 0xd1;
  0xe6; 0x18; 0x8d; 0x0b;
  0x04; 0x6d; 0xf3; 0x44;
  0x70; 0x6c; 0x63; 0x1e
]

let test_key1 = List.Tot.map u8 [
  0x60; 0x3d; 0xeb; 0x10; 0x15; 0xca; 0x71; 0xbe;
  0x2b; 0x73; 0xae; 0xf0; 0x85; 0x7d; 0x77; 0x81;
  0x1f; 0x35; 0x2c; 0x07; 0x3b; 0x61; 0x08; 0xd7;
  0x2d; 0x98; 0x10; 0xa3; 0x09; 0x14; 0xdf; 0xf4
]

let test_iv1 = List.Tot.map u8 [
  0x00; 0x01; 0x02; 0x03; 0x04; 0x05; 0x06; 0x07;
  0x08; 0x09; 0x0A; 0x0B; 0x0C; 0x0D; 0x0E; 0x0F
]

let test_plaintext1 = List.Tot.map u8 [
  0x6b; 0xc1; 0xbe; 0xe2; 0x2e; 0x40; 0x9f; 0x96;
  0xe9; 0x3d; 0x7e; 0x11; 0x73; 0x93; 0x17; 0x2a
]

let test_ciphertext1 = List.Tot.map u8 [
 0xf5; 0x8c; 0x4c; 0x04; 0xd6; 0xe5; 0xf1; 0xba;
 0x77; 0x9e; 0xab; 0xfb; 0x5f; 0x7b; 0xfb; 0xd6
]

let test() : FStar.All.ML unit =
  let computed = keyExpansion (of_list test_expansion_key1) in
  IO.print_string "keyExpansion expected:\n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (test_expansion_expanded1);
  IO.print_string "\n";
  IO.print_string "keyExpansion computed:\n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (to_list #uint8 computed);
  IO.print_string "\n";
(*  let seq = create 256 (u8 0) in
  let seqi = repeati #(lseq uint8 256) 256 (fun i s -> s.[i] <- u8 i) seq in
  (*
  let inv = map (fun s -> from_elem (finv (to_elem s))) seqi in
  IO.print_string "inv i:     \n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a)); IO.print_string " ; ") (to_list #uint8 #256 inv);
  IO.print_string "\n";
  *)
  let seqsbox = map (fun s -> sub_byte s) seqi in
  IO.print_string "sbox i:     \n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a)); IO.print_string " ; ") (to_list #uint8 seqsbox);
  IO.print_string "\n";
(*
  let seqsbox_16 = map (fun s -> sbox_bp_16 s) seqi in
  IO.print_string "sbox bp_i i:\n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a)); IO.print_string " ; ") (to_list #uint8 seqsbox_16);
  IO.print_string "\n";
  *)
  let key = of_list test_key1 in
  let iv = of_list test_iv1 in
  let plain = of_list test_plaintext1 in
  let expected = of_list test_ciphertext1 in
  let cip = cipher key 12 nonce counter plain in
//  let cip = aes128_block key nonce counter in
//  let cip = map2 (logxor #U8) cip plain in
  IO.print_string "aes_cip computed:\n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a)); IO.print_string " ; ") (to_list #uint8 cip);
  IO.print_string "\n";
  IO.print_string "aes_cip expected:\n";
  FStar.List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a)); IO.print_string " ; ") (to_list #uint8 expected);
  IO.print_string "\n";*)
  ()