# 🚀 **CryptoMiningHub**

Plataforma completa para monitoramento de mineração de criptomoedas, trading e análise blockchain.

## 🎯 **Visão Geral**

O CryptoMiningHub é uma solução integrada que combina:
- 📊 **Dashboard Moderno**: Interface responsiva e intuitiva
- 🔗 **Blockchain Integration**: Conexão com múltiplas blockchains
- 💰 **Crypto Trading**: Portfolio e trading de criptomoedas
- ⛏️ **Mining Monitor**: Monitoramento de rigs de mineração
- 📱 **Mobile App**: Aplicativo para monitoramento móvel

## 🛠️ **Tecnologias**

### **Frontend**
- React 18 + TypeScript
- Next.js 14 (App Router)
- Tailwind CSS
- Chart.js/Recharts
- Framer Motion

### **Backend**
- Node.js + Express
- TypeScript
- PostgreSQL
- Redis
- WebSocket

### **Blockchain**
- Web3.js/Ethers.js
- Hardhat/Truffle
- Solidity
- IPFS

### **Mobile**
- React Native
- TypeScript
- Expo

### **DevOps**
- Docker
- Kubernetes
- GitHub Actions
- Prometheus + Grafana

## 📦 **Instalação**

### **Pré-requisitos**
- Node.js 18+
- Docker e Docker Compose
- Git

### **Setup Rápido com Docker (Recomendado)**

```bash
# Clone o repositório
git clone https://github.com/edugenes/dashhub.git
cd dashhub

# Instale as dependências
npm run install:all

# Configure as variáveis de ambiente
cp .env.example .env

# Inicie com Docker
npm run docker:start
```

### **Setup Manual (Sem Docker)**

```bash
# Clone o repositório
git clone https://github.com/edugenes/dashhub.git
cd dashhub

# Instale as dependências
npm run install:all

# Configure as variáveis de ambiente
cp .env.example .env

# Instale PostgreSQL e Redis separadamente
# Execute o projeto
npm run dev
```
```

### **Setup Detalhado**

1. **Frontend**
```bash
cd frontend
npm install
npm run dev
```

2. **Backend**
```bash
cd backend
npm install
npm run dev
```

3. **Mobile**
```bash
cd mobile
npm install
npm run start
```

## 🚀 **Scripts Disponíveis**

- `npm run dev` - Executa frontend e backend
- `npm run build` - Build de produção
- `npm run test` - Executa todos os testes
- `npm run install:all` - Instala todas as dependências

## 📚 **Documentação**

Consulte a pasta `/docs` para documentação completa:
- [Guia de Setup](docs/guides/setup.md)
- [Guia de Desenvolvimento](docs/guides/development.md)
- [API Documentation](docs/api/README.md)
- [Arquitetura](docs/ARCHITECTURE.md)

## 🎯 **Roadmap**

Consulte [ROADMAP.md](ROADMAP.md) para o cronograma completo de desenvolvimento.

## 🤝 **Contribuição**

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 **Licença**

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

## 📞 **Suporte**

- 📧 Email: suporte@cryptomininghub.com
- 💬 Discord: [CryptoMiningHub Community](https://discord.gg/cryptomininghub)
- 📱 Twitter: [@CryptoMiningHub](https://twitter.com/cryptomininghub)

## 🙏 **Agradecimentos**

- Comunidade open source
- Contribuidores do projeto
- Usuários beta testers

---

**Desenvolvido com ❤️ para a comunidade crypto**
