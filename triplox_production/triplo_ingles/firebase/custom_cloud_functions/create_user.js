const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Inicialize o Firestore
const db = admin.firestore();

exports.createUser = functions.https.onCall((data, context) => {
  const email = data.email;
  const password = data.password;
  const displayName = data.displaynamee;
  const phoneNumber = data.phonenumberr;
  const cpf = data.cpf;
  const saldo = data.saldo;

  if (!email || !password || !displayName || !phoneNumber || !cpf || !saldo) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Por favor, forneça todos os campos necessários. ",
      phoneNumber,
    );
  }

  return admin
    .auth()
    .createUser({
      email: email,
      password: password,
      displayName: displayName,
      //phoneNumber: phoneNumber
    })
    .then((userRecord) => {
      // Armazene os detalhes do usuário no Firestore
      const userDetails = {
        id: userRecord.uid, // Esta é a informação de id
        uid: userRecord.uid, // Esta é a informação de uid
        display_name: displayName,
        phone_number: phoneNumber,
        cpf: cpf,
        email: email,
        saldo: saldo,
      };
      return db
        .collection("users")
        .doc(userRecord.uid)
        .set(userDetails)
        .then(() => {
          return { userId: userRecord.uid };
        });
    })
    .catch((error) => {
      throw new functions.https.HttpsError("internal", error.message);
    });
});
