import mongoose from "mongoose";

interface VocabularyAttrs {
  value: string;
  translated: string;
}

interface VocabularyModel extends mongoose.Model<VocabularyDoc> {
  build(attrs: VocabularyAttrs): VocabularyDoc;
}

interface VocabularyDoc extends mongoose.Document {
  value: string;
  translated: string;
}

const vocabularySchema = new mongoose.Schema(
  {
    value: {
      type: String,
      required: true,
    },
    translated: {
      type: String,
      required: true,
    },
  },
  {
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

vocabularySchema.statics.build = (attrs: VocabularyAttrs) => {
  return new Vocabulary(attrs);
};

const Vocabulary = mongoose.model<VocabularyDoc, VocabularyModel>(
  "Vocabulary",
  vocabularySchema
);

export { Vocabulary };
