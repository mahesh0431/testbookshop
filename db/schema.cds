namespace bookshop.learning;

using { Currency, managed } from '@sap/cds/common';

type Genre: String enum{
  Mystery; Fiction; Drama;
}

entity Books : managed {
  key ID   : Integer;
  title    : localized String(111);
  descr    : localized String(1111);
  author   : Association to Authors;
  stock    : Integer;
  price    : Decimal(9,2);
  genre    : Genre;
  currency : Currency;
}

entity Authors : managed {
  key ID   : Integer;
  name     : String(111);
  books    : Association to many Books on books.author = $self;
}

entity Orders : managed {
    key ID      :   UUID;
        OrderNo :   String;
        // Items   :   Association to many OrderItems on Items.parent = $self;
        Items   :   Composition of many OrderItems on Items.parent = $self;
}

entity OrderItems{
    key ID      :   UUID;
        parent  :   Association to Orders;
        book    :   Association to Books;
        amount  :   Integer;
}

