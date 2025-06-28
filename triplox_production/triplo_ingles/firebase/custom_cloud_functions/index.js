const admin = require("firebase-admin/app");
admin.initializeApp();

const createUser = require("./create_user.js");
exports.createUser = createUser.createUser;
const sendHttpWhatsAppProfessor = require("./send_http_whats_app_professor.js");
exports.sendHttpWhatsAppProfessor =
  sendHttpWhatsAppProfessor.sendHttpWhatsAppProfessor;
const enviarLembrete = require("./enviar_lembrete.js");
exports.enviarLembrete = enviarLembrete.enviarLembrete;
