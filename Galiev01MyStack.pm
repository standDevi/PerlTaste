#!/usr/bin/perl


=head1 MyStack

Модуль реализует простейший стек

=cut


=head2 count()

Метод возвращает число элементов в стеке

=cut


=head2 empty()

Метод возвращает FALSE, если стек не пуст
Метод возвращает TRUE, если стек пуст

=cut


=head2 peek()

Метод возвращает верхний элемент стека, элемент из стека не удаляется

=cut


=head2 get( $index )

Метод принимает индекс
Если индекс не передан, возвращает undef
Если по данному индексу элемент в стеке есть, возвращает элемент, элемент из стека не удаляется
Если по данному индексу элемента в стеке нет, возвращает undef

=cut


=head2 pop()

Возвращает верхний элемент, удаляет его из стека

=cut


=head2 clear()

Очищает стек, возвращает SUCCESS

=cut


=head2 push( $item )

Принимает элемент для добавления в стек
Если элемент не передан, не добавляет элемент в стек, возвращает число элементов в стеке
Иначе добавляет элемент в стек, возвращает число элементов в стеке

=cut


package MyStack;

use strict;
use warnings;


use constant FALSE                             => 0;
use constant TRUE                              => 1;
use constant STACK_BOTTOM                      => -1;
use constant SUCCESS                           => -1;

# Конструктор
sub new 
{
  my ($class) = @_;
  
  my $self =
  {
    stack => [],
  };
  
  bless $self, $class;
  
  return $self;
}

# Получить число элементов в стеке
sub count
{
  my($self) = shift;
  return (scalar(@{$self->{stack}}));
}

# Проверить, что стек пуст
sub is_empty
{
  my($self) = shift;
  return $self->count() ? FALSE : TRUE;
}

# Получить верхний элемент, но не удалять его из стека
sub peek
{
  my($self) = shift;
  return $self->{stack}->[STACK_BOTTOM];
}

# Получить элемент по индексу, но не удалять его из стека
sub get
{
  my($self) = shift;
  my($_index) = shift;
  
  if(not defined $_index)
  {
    return undef;
  }
  
  # Последний элемент стека (индекс -1) это элемент массива с индексом 0
  # Первый элемент стека (индекс 0) это элемент массива с индексом -1
  # Другими словами, вершина стека это последний элемент массива
  # Поэтому к отрицательным индексам прибавляем 1 и у суммы меняем знак
  # А у положительных индексов меняем знак, потом вычитаем 1
  # Можно изменить реализацию вставки через splice, чтобы вершина стека соответствовала 0 элементу массива
  if($_index < 0)
  {
    $self->{stack}->[-($_index + 1)];
  }
  else
  {
    $self->{stack}->[(-$_index) - 1];
  }
}

# Получить верхний элемент, удалить его из стека
sub pop
{
  my($self) = shift;
  return pop(@{$self->{stack}});
}

# Очистить стек
sub clear
{
  my($self) = shift;
  $self->{stack} = [];
  return SUCCESS;
}

# Добавить элемент в стек
sub push
{
  my($self) = shift;
  my($item) = shift;
  
  if(defined $item)
  {
    push(@{$self->{stack}}, $item);
  }
  
  return $self->count();
}

1;
