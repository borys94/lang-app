import mongoose from "mongoose";

// An interface that describes the properties
// that are requried to create a new User
interface ExerciseAttrs {
  title: string;
  lang: string;
  level: string
}

// An interface that describes the properties
// that a User Model has
interface ExerciseModel extends mongoose.Model<ExerciseDoc> {
  build(attrs: ExerciseAttrs): ExerciseDoc;
}

// An interface that describes the properties
// that a User Document has
export interface ExerciseDoc extends mongoose.Document {
  id: number;
  title: string;
  lang: string;
  level: string
  createdAt: string;
  updatedAt: string;
}

export const exerciseSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true
    },
    lang: {
      type: String,
      required: true
    },
    level: {
      type: String,
      required: true
    }
  },
  {
    timestamps: true,
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.__v;
      }
    }
  }
);

exerciseSchema.pre("save", async function(done) {
  this.set("updatedAt", Date.now());
  done();
});

exerciseSchema.statics.build = (attrs: ExerciseAttrs) => {
  return new Exercise(attrs);
};

const Exercise = mongoose.model<ExerciseDoc, ExerciseModel>("Exercise", exerciseSchema);

export { Exercise };
