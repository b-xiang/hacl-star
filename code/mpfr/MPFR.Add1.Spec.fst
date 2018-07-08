module MPFR.Add1.Spec

open FStar.Mul
open MPFR.Dyadic
open MPFR.Lib.Spec
open MPFR.Maths

#set-options "--z3refresh --z3rlimit 15 --max_fuel 1 --initial_fuel 0 --max_ifuel 1 --initial_ifuel 0"

(* In this specification we only consider MPFR normal numbers as input *)

(* Useful functions when adding two MPFR numbers with same precision
 * and the exponent of the first one is greater than that of the second one *)
val add_sp_ge_limb: a:mpfr_reg_fp -> b:mpfr_reg_fp -> Pure nat
    (requires (a.sign = b.sign /\ a.prec = b.prec /\ a.exp >= b.exp))
    (ensures  (fun rm -> rm * a.sign = (eval a +. eval b).significand /\
                      rm % pow2 (a.len - a.prec) = 0))
    
let add_sp_ge_limb a b =
    lemma_distr_add_left a.sign (a.limb * pow2 (a.exp - b.exp)) (b.limb * pow2 0);
    //! assert((a.limb * pow2 (a.exp - b.exp) + b.limb) * a.sign = (eval a +. eval b).significand);
    lemma_mul_mod a.limb (pow2 (a.exp - b.exp)) (pow2 (a.len - a.prec));
    lemma_mod_distr_zero (a.limb * pow2 (a.exp - b.exp)) b.limb (pow2 (a.len - a.prec));
    //! assert((a.limb * pow2 (a.exp - b.exp) + b.limb) % pow2 (a.len - a.prec) = 0);
    a.limb * pow2 (a.exp - b.exp) + b.limb

val add_sp_ge_len: a:mpfr_reg_fp -> b:mpfr_reg_fp -> Pure pos
    (requires (a.sign = b.sign /\ a.prec = b.prec /\ a.exp >= b.exp))
    (ensures  (fun rl -> add_sp_ge_limb a b >= pow2 (rl - 1) /\
                      add_sp_ge_limb a b < pow2 rl))

let add_sp_ge_len a b =
    let d = a.exp - b.exp in
    if add_sp_ge_limb a b < pow2 (a.len + d) then begin
	lemma_mul_le_right (pow2 d) (pow2 (a.len - 1)) a.limb;
	lemma_pow2_mul (a.len - 1) d;
	//! assert(pow2 (a.len - 1 + d) <= add_sp_ge_limb a b);
	a.len + d
    end else begin
        lemma_mul_lt_right (pow2 d) a.limb (pow2 a.len);
        lemma_pow2_mul a.len d;
	lemma_pow2_le b.len (a.len + d);
        lemma_pow2_double (a.len + d);
	//! assert(add_sp_ge_limb a b < pow2 (a.len + d + 1));
	a.len + d + 1
    end

val add_sp_ge_exp: a:mpfr_reg_fp -> b:mpfr_reg_fp -> Pure int
    (requires (a.sign = b.sign /\ a.prec = b.prec /\ a.exp >= b.exp))
    (ensures  (fun rx -> rx - add_sp_ge_len a b = (eval a +. eval b).exponent))

let add_sp_ge_exp a b =
    if add_sp_ge_limb a b < pow2 (a.len + a.exp - b.exp) then a.exp else a.exp + 1
    
val add_sp_ge_prec: a:mpfr_reg_fp -> b:mpfr_reg_fp -> Pure pos
    (requires (a.sign = b.sign /\ a.prec = b.prec /\ a.exp >= b.exp))
    (ensures  (fun rp -> add_sp_ge_len a b - rp = a.len - a.prec))
    
let add_sp_ge_prec a b = a.prec + add_sp_ge_len a b - a.len

(* Addition for two MPFR numbers with same precision *)
val add_sp: a:mpfr_reg_fp -> b:mpfr_reg_fp -> Pure normal_fp
    (requires (a.sign = b.sign /\ a.prec = b.prec))
    (ensures  (fun r -> eval a +. eval b =. eval r))
    
let add_sp a b = 
    let a, b = if a.exp >= b.exp then a, b else b, a in
    mk_normal a.sign (add_sp_ge_prec a b) (add_sp_ge_exp a b) (add_sp_ge_limb a b) (add_sp_ge_len a b) MPFR_NUM
