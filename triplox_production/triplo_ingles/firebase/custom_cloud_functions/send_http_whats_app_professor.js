const functions = require("firebase-functions");
const axios = require("axios");

exports.sendHttpWhatsAppProfessor = functions.https.onCall(
  async (data, context) => {
    const variavelphone = data.phone;
    const variavel_nome = data.name;
    const variavel_email = data.email;
    const variavel_senha = data.password || "acesso123@";
    const variavel_primeiro_nome = data.firstName;
    const variavel_ultimo_nome = data.lastName || "NAN";

    const sendFirstAndSecondPost = async () => {
      try {
        // Primeiro POST
        const response = await axios.post(
          `https://conversa.com/v1/mensagem/${variavelphone}`,
          {},
          {
            headers: {
              "API-KEY": "12330a0015c-550c-4f45-a698-5cc327c85205",
            },
          },
        );

        const id = response.data.id;

        // Segundo POST
        await axios.post(
          `https://conversa.com/v2/${id}/mensagem`,
          {
            type: "text",
            value: `Olá ${variavel_nome}!
                          Você foi cadastrado na plataforma Triplo X !

                          Seu email: ${variavel_email}

                          Sua senha: ${variavel_senha}

                          Acesse: inglestriplox.com.br/login`,
          },
          {
            headers: {
              "API-KEY": "30a0015c-550c-4f45-a698-5cc327c85205",
            },
          },
        );
      } catch (error) {
        throw error;
      }
    };

    try {
      await sendFirstAndSecondPost();
    } catch (error) {
      // Em caso de erro no primeiro POST, executamos o terceiro POST
      await axios.post(
        "https://backend.botconversa.com.br/api/v1/webhook/subscriber/",
        {
          phone: variavelphone,
          first_name: variavel_primeiro_nome,
          last_name: variavel_ultimo_nome,
        },
        {
          headers: {
            "API-KEY": "30a0015c-550c-4f45-a698-5cc327c85205",
          },
        },
      );

      // Tente novamente o primeiro e o segundo POST após o terceiro POST
      await sendFirstAndSecondPost();
    }

    return { success: true };
  },
);
