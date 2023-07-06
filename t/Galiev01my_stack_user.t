#!/usr/bin/perl

use strict;
use warnings;


# Этот модуль обеспечивает тестирование
use Test::More tests => 22;


# Тестируем этот модуль
use Galiev01MyStack;


use constant OUT_OF_BOUND                      => 50;
use constant SIZE_OF_EMPTY_STACK               => 0;
use constant STACK_SIZE_AFTER_3_PUSHES         => 3;
use constant STACK_SIZE_AFTER_3_PUSHES_AND_POP => STACK_SIZE_AFTER_3_PUSHES - 1;


# Эти элементы будем добавлять в стек
my $first_elem = 1;
my $second_elem = [2, 3,];
my $third_elem = {'a' => 1, 'b' => 2,};


my $stack = MyStack->new();


#   Тестируемый метод                   Ожидаемый результат                   Примечание к тесту
ok( defined $stack,                                                        '  no allocation error'                 );
is( $stack->empty,                      $stack->TRUE,                      '  stack is empty'                      );
is( $stack->peek,                       undef,                             '  peek from empty stack'               );
is( $stack->get($stack->STACK_BOTTOM),  undef,                             '  get bottom element from empty stack' );
is( $stack->pop,                        undef,                             '  pop from empty stack'                );
is( $stack->count,                      SIZE_OF_EMPTY_STACK,               '  count members of empty stack'        );
is( $stack->clear,                      $stack->SUCCESS,                   '  clear empty stack'                   );
is( $stack->push($first_elem),          $stack->count,                     '  push scalar to stack'                );
is( $stack->push($second_elem),         $stack->count,                     '  push array to stack'                 );
is( $stack->push($third_elem),          $stack->count,                     '  push hash to stack'                  );
is( $stack->push,                       $stack->count,                     '  push empty elem has no effect'       );
is( $stack->count,                      STACK_SIZE_AFTER_3_PUSHES,         '  right size after 3 pushes'           );
is( $stack->empty,                      $stack->FALSE,                     '  stack is not empty'                  );
is( $stack->peek,                       $third_elem,                       '  peek from stack'                     );
is( $stack->get($stack->STACK_BOTTOM),  $first_elem,                       '  get bottom element from stack'       );
is( $stack->pop,                        $third_elem,                       '  pop from stack'                      );
is( $stack->count,                      STACK_SIZE_AFTER_3_PUSHES_AND_POP, '  right size after 3 pushes and pop'   );
is( $stack->clear,                      $stack->SUCCESS,                   '  clear stack'                         );
is( $stack->empty,                      $stack->TRUE,                      '  stack is empty after clear'          );
is( $stack->count,                      SIZE_OF_EMPTY_STACK,               '  right size after clear'              );
is( $stack->get(OUT_OF_BOUND),          undef,                             '  check out of bound'                  );
is( $stack->get,                        undef,                             '  get without index'                   );
