import { Publisher, Subjects, TicketCreatedEvent } from "@lang-common/common";

export class VocabularyCreatedPublisher extends Publisher<TicketCreatedEvent> {
  readonly subject = Subjects.TicketCreated;
}
