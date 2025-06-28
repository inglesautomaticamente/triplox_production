const functions = require("firebase-functions");
const admin = require("firebase-admin");
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const { google } = require("googleapis");
const OAuth2 = google.auth.OAuth2;
const calendar = google.calendar("v3");

const SCOPES = ["https://www.googleapis.com/auth/calendar.readonly"];
const TOKEN = "YOUR_GOOGLE_CALENDAR_API_TOKEN"; // Substitua pelo seu token

exports.enviarLembrete = functions.https.onRequest(async (req, res) => {
  const eventId = req.query.eventId; // Receba o ID do evento como parâmetro

  try {
    // Use o ID do evento para buscar informações sobre o evento no Firestore
    const eventoSnapshot = await admin
      .firestore()
      .collection("aulas")
      .doc(eventId)
      .get();

    if (eventoSnapshot.exists) {
      const evento = eventoSnapshot.data();
      const professorId = evento.professorId;

      // Consulte o Firestore para obter as informações do professor
      const professorSnapshot = await admin
        .firestore()
        .collection("professores")
        .doc(professorId)
        .get();
      const professor = professorSnapshot.data();

      // Calcule a data e hora para enviar o lembrete (24 horas antes do evento)
      const dataEvento = new Date(evento.dataEvento.toDate());
      const dataLembrete = new Date(dataEvento.getTime() - 24 * 60 * 60 * 1000);

      // Enviar um lembrete ao professor
      const oauth2Client = new OAuth2(
        process.env.CLIENT_ID,
        process.env.CLIENT_SECRET,
        process.env.REDIRECT_URL,
      );
      oauth2Client.setCredentials({
        access_token: professor.googleAccessToken,
        refresh_token: professor.googleRefreshToken,
      });

      calendar.events.list(
        {
          auth: oauth2Client,
          calendarId: "primary",
          timeMin: dataLembrete.toISOString(),
          timeMax: dataLembrete.toISOString(),
          singleEvents: true,
          orderBy: "startTime",
        },
        (err, response) => {
          if (err) {
            console.error("Erro ao buscar eventos do Google Calendar:", err);
            return res
              .status(500)
              .send("Erro ao buscar eventos do Google Calendar.");
          }

          const events = response.data.items;
          if (events.length === 0) {
            console.log("Nenhum evento encontrado.");
          } else {
            // Envie um lembrete ao professor (por exemplo, uma notificação por e-mail ou mensagem)
            console.log("Enviar lembrete ao professor");
          }
        },
      );

      res.status(200).send("Lembrete enviado com sucesso!");
    } else {
      res.status(404).send("Evento não encontrado.");
    }
  } catch (error) {
    console.error("Erro ao enviar lembrete:", error);
    res.status(500).send("Erro ao enviar lembrete.");
  }
});
