using { bookshop.learning as my } from '../db/schema';
service CatalogService @(path:'/browse') {
    @readonly entity Books as select from my.Books{*,
        author.name as author } excluding { createdBy, createdAt };

    @requires_: 'authenticated-user'
    @insertonly entity Orders as projection on my.Orders;
}