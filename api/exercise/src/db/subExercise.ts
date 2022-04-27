import mongoose from "mongoose";

// An interface that describes the properties
// that are requried to create a new User
interface SubExerciseAttrs {
  text: string;
  title: string;
  answers: string;
  exerciseId: string;
}

// An interface that describes the properties
// that a User Model has
interface SubExerciseModel extends mongoose.Model<SubExerciseDoc> {
  build(attrs: SubExerciseAttrs): SubExerciseDoc;
}

// An interface that describes the properties
// that a User Document has
interface SubExerciseDoc extends mongoose.Document {
  id: number;
  exerciseId: string,
  text: string;
  title: string;
  answers: string
  createdAt: string;
  updatedAt: string;
}

const subExerciseSchema = new mongoose.Schema(
  {
    text: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    answers: {
      type: String,
      required: true
    },
    exerciseId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Exercise"
    },
  },
  {
    timestamps: true,
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.__v;
        // ret.answers = ret.answers.split(",").map((answer: string) => answer.trim())
      }
    }
  }
);

subExerciseSchema.pre("save", async function(done) {
  this.set("updatedAt", Date.now());
  done();
});

subExerciseSchema.statics.build = (attrs: SubExerciseAttrs) => {
  return new SubExercise(attrs);
};

const SubExercise = mongoose.model<SubExerciseDoc, SubExerciseModel>("SubExercise", subExerciseSchema);

export { SubExercise };
