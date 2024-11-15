/* eslint-disable consistent-return */
class EmailService {

  constructor() { }

  async submit(payload){
    console.log(`Email Service: Payload recebido`, payload);
    const body = {
      ...this.setSubject(payload)
    }
    try {
      const url = '/wp-json/api/email'
      const options = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body)
      }

      const response = await fetch(url, options)
      if(!response.ok){
        throw new Error(response.statusText)
      }
      const data = await response.json()
      if(data.status === false){
        throw new Error(`Erro ao cadastrar o formulário ${data.message}`)
      }
      return data
    } catch (error) {
      throw new Error(`Erro ao enviar o formulário usando o serviço de email: ${error.message}`)
    }
  }

  setSubject(payload){
    const neWPayload = {}
    Object.keys(payload).forEach(function(key){
      if(key.includes('subject')){
        neWPayload['subject'] = payload[key]
      }else{
        neWPayload[key] = payload[key]
      }
    })
    return neWPayload
  }
}
export {EmailService}