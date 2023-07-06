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
  return scalar( @{ $self->{stack} } );
}

# Проверить, что стек пуст
sub is_empty
{
  my($self) = shift;
  return $self->count() ? FALSE : TRUE;
}

# Получить верхний элемент, удалить его из стека
sub pop
{
  my($self) = shift;
  return pop( @{ $self->{stack} } );
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
    push( @{ $self->{stack} }, $item );
  }
  
  return $self->count();
}

1;
