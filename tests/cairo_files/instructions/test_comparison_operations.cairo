// SPDX-License-Identifier: MIT

%lang starknet

// Starkware dependencies
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.cairo.common.uint256 import Uint256

// Local dependencies
from kakarot.model import model
from kakarot.stack import Stack
from kakarot.execution_context import ExecutionContext
from kakarot.instructions.comparison_operations import ComparisonOperations
from tests.utils.utils import TestHelpers

@external
func test__exec_lt__should_pop_0_and_1_and_push_0__when_0_not_lt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_lt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_lt__should_pop_0_and_1_and_push_1__when_0_lt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_lt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_gt__should_pop_0_and_1_and_push_0__when_0_not_gt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_gt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_gt__should_pop_0_and_1_and_push_1__when_0_gt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_gt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_slt__should_pop_0_and_1_and_push_0__when_0_not_slt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_slt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_slt__should_pop_0_and_1_and_push_1__when_0_slt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_slt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_sgt__should_pop_0_and_1_and_push_0__when_0_not_sgt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_sgt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_sgt__should_pop_0_and_1_and_push_1__when_0_sgt_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_sgt(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_eq__should_pop_0_and_1_and_push_0__when_0_not_eq_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_eq(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_eq__should_pop_0_and_1_and_push_1__when_0_eq_1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_eq(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_iszero__should_pop_0_and_push_0__when_0_is_not_zero{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_iszero(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_iszero__should_pop_0_and_push_1__when_0_is_zero{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(0, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_iszero(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_and__should_pop_0_and_1_and_push_0__when_0_and_1_are_not_true{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(0, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_and(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_and__should_pop_0_and_1_and_push_1__when_0_and_1_are_true{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_and(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_or__should_pop_0_and_1_and_push_0__when_0_or_1_are_not_true{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(0, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(0, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_or(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(0, 0);
    return ();
}

@external
func test__exec_or__should_pop_0_and_1_and_push_1__when_0_or_1_are_true{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(0, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(1, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_or(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_shl__should_pop_0_and_1_and_push_left_shift{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(4, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_shl(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(32, 0);
    return ();
}

@external
func test__exec_shr__should_pop_0_and_1_and_push_right_shift{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(4, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_shr(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}

@external
func test__exec_sar__should_pop_0_and_1_and_push_shr{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() {
    // Given
    alloc_locals;
    let (bytecode) = alloc();
    let stack: model.Stack* = Stack.init();

    let stack: model.Stack* = Stack.push(stack, Uint256(4, 0));
    let stack: model.Stack* = Stack.push(stack, Uint256(2, 0));
    let ctx: model.ExecutionContext* = TestHelpers.init_context_with_stack(0, bytecode, stack);

    // When
    let result = ComparisonOperations.exec_sar(ctx);

    // Then
    assert result.gas_used = 3;
    let len: felt =  result.stack.len_16bytes / 2;
    assert len = 1;
    let (stack,index0) = Stack.peek(result.stack, 0);
    assert index0 = Uint256(1, 0);
    return ();
}
