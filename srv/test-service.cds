using { bookshop.learning as my } from '../db/schema';

service MyService {
    entity Proposal as projection on my.Proposal;
}