//
//  SWTUtils.mm
//
//  Created by Emily Kolar on 7/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "SWTUtils.h"

const_CGFloat_ptr to_value_const_CGFloat_ptr(Local<Value> x, bool* failed) {
  return const_CGFloat_ptr::FromJS(x, failed, "Expected CGFloat");
}

bool is_value_const_CGFloat_ptr(Local<Value> x) {
  return const_CGFloat_ptr::IsJS(x);
}

const_CGRect_ptr to_value_const_CGRect_ptr(Local<Value> x, bool* failed) {
  return const_CGRect_ptr::FromJS(x, failed, "Expected CGRect");
}

bool is_value_const_CGRect_ptr(Local<Value> x) {
  return const_CGRect_ptr::IsJS(x);
}

const_CGPoint_ptr to_value_const_CGPoint_ptr(Local<Value> x, bool* failed) {
  return const_CGPoint_ptr::FromJS(x, failed, "Expected CGPoint");
}

bool is_value_const_CGPoint_ptr(Local<Value> x) {
  return const_CGPoint_ptr::IsJS(x);
}

const_CGSize_ptr to_value_const_CGSize_ptr(Local<Value> x, bool* failed) {
  return const_CGSize_ptr::FromJS(x, failed, "Expected CGSize");
}

bool is_value_const_CGSize_ptr(Local<Value> x) {
  return const_CGSize_ptr::IsJS(x);
}

const_CGGlyph_ptr to_value_const_CGGlyph_ptr(Local<Value> x, bool* failed) {
  return const_CGGlyph_ptr::FromJS(x, failed, "Expected CGGlyph");
}

bool is_value_const_CGGlyph_ptr(Local<Value> x) {
  return const_CGGlyph_ptr::IsJS(x);
}




const_uint32_t_ptr to_value_const_uint32_t_ptr(Local<Value> x, bool* failed) {
  return const_uint32_t_ptr::FromJS(x, failed, "Expected uint32_t");
}

bool is_value_const_uint32_t_ptr(Local<Value> x) {
  return const_uint32_t_ptr::IsJS(x);
}
