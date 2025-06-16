# PaymentServicePoC

This solution contains several microservices that work together to simulate a payment platform. Services are written in ASP.NET Core 8 and include:

- `PaymentService`
- `TokenService`
- `TransactionLogService`
- `WalletService`

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download)
- Visual Studio 2022 or newer

## Cloning and Running Locally (without Docker)
1. **Clone the repository**

   ```bash
   git clone https://github.com/Hedgehog-From-Outerspace/PaymentServicePoC.git
   cd PaymentServicePoC
   ```

2. Open the solution in Visual Studio
   Double-click the `PaymentServicePoC.sln` file or open it via Visual Studio.

3. Set up launch profiles
   - Each serice has its own `launchSettings.json` with a unique port (e.g. 5000, 5001, etc).
   - You can run each service by right-clicking the project > *Debug* > *Start New Instance*.
   - Or set multiple startup projects: Solution > Right-click > Properties > Startup Project > Multiple Startup Projects.
  
4. Run all services
   Ensure the following projects are set to run:
   - `PaymentService` on [http://localhost:5000](http://localhost:5000)
   - `TokenService` on [http://localhost:5001](http://localhost:5001)
   - `TransactionLogService` on [http://localhost:5002](http://localhost:5002)
   - `WalletService` on [http://localhost:5003](http://localhost:5003)
  
5. Open Swagger UI
   You can now access the Swagger UI for each service:
   - [PaymentService Swagger](http://localhost:5000/swagger)
   - [TokenService Swagger](http://localhost:50001/swagger)
   - [TransactionLogService Swagger](http://localhost:5002/swagger)
   - [WalletService Swagger](http://localhost:5003/swagger)
  
## Documentation
See the [wiki](https://github.com/Hedgehog-From-Outerspace/PaymentServicePoC/wiki) for:
- Docker setup & usage
- Git workflow
- JWT token usage
- Internal port & service configuration
