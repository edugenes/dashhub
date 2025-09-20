# 🐳 **DOCKER SETUP - CryptoMiningHub**

## 📋 **Pré-requisitos**

Para usar o Docker com o CryptoMiningHub, você precisa instalar:

### **1. Docker Desktop (Windows)**

1. **Baixe o Docker Desktop:**
   - Acesse: https://www.docker.com/products/docker-desktop/
   - Clique em "Download for Windows"

2. **Instale o Docker Desktop:**
   - Execute o instalador baixado
   - Siga as instruções do instalador
   - Reinicie o computador se necessário

3. **Verifique a instalação:**
   ```powershell
   docker --version
   docker-compose --version
   ```

### **2. Configuração do Docker Desktop**

1. **Inicie o Docker Desktop**
2. **Configure recursos:**
   - Vá em Settings > Resources
   - Aloque pelo menos 4GB de RAM
   - Aloque pelo menos 2 CPUs

3. **Habilite WSL2 (recomendado):**
   - Vá em Settings > General
   - Marque "Use the WSL 2 based engine"

## 🚀 **Como Usar o Docker**

### **Opção 1: Script Automático (Recomendado)**
```powershell
npm run docker:start
```

### **Opção 2: Comandos Manuais**
```powershell
# Iniciar todos os serviços
docker-compose up --build -d

# Ver logs
docker-compose logs -f

# Parar serviços
docker-compose down

# Limpar tudo (cuidado!)
docker-compose down -v --remove-orphans
```

## 📊 **Serviços Incluídos**

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:3001
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## 🔧 **Comandos Úteis**

```powershell
# Ver status dos containers
docker-compose ps

# Entrar em um container
docker-compose exec backend bash
docker-compose exec postgres psql -U postgres -d cryptomininghub

# Ver logs de um serviço específico
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f postgres
docker-compose logs -f redis

# Reiniciar um serviço
docker-compose restart backend

# Rebuildar um serviço
docker-compose up --build backend
```

## 🐛 **Solução de Problemas**

### **Erro: "Docker is not running"**
- Inicie o Docker Desktop
- Aguarde até aparecer o ícone verde na bandeja do sistema

### **Erro: "Port already in use"**
- Verifique se as portas 3000, 3001, 5432, 6379 estão livres
- Use `netstat -an | findstr :3000` para verificar

### **Erro: "Permission denied"**
- Execute o PowerShell como Administrador
- Ou use: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### **Erro: "Out of memory"**
- Aumente a RAM alocada para o Docker Desktop
- Vá em Settings > Resources > Memory

## 📚 **Próximos Passos**

1. **Instale o Docker Desktop**
2. **Execute**: `npm run docker:start`
3. **Acesse**: http://localhost:3000
4. **Verifique a saúde**: http://localhost:3001/api/health

---

**💡 Dica**: Se preferir não usar Docker, você pode executar o projeto localmente com `npm run dev` após instalar PostgreSQL e Redis separadamente.
