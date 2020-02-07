const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    // .first()
    .then(scheme => {
      if (scheme) {
        return scheme[0];
      } else {
        return null;
      }
    });
}

function findSteps(id) {
  return db("steps")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .join("schemes", "scheme.id", "steps.scheme_id")
    .where({ scheme_id: id });
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(ids => {
      return findByID(ids[0]);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(scheme => {
      return findByID(id);
    });
}

function remove(id) {
  return findByID(id).then(schemeId => {
    if (schemeId) {
      return db("schemes")
        .where({ id })
        .del();
    } else {
      return null;
    }
  });
}
