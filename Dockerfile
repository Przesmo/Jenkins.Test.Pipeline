FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["Test.Api/Test.Api/Test.Api.csproj", "Test.Api/"]

RUN dotnet restore "Test.Api/Test.Api.csproj" -r linux-musl-x64
COPY . .
WORKDIR "/src/Test.Api"
RUN dotnet build "Test.Api.csproj" -c Release -r linux-musl-x64 -o /app/build --no-restore

FROM build AS publish
RUN dotnet publish "Test.Api.csproj" -c Release -r linux-musl-x64 -o /app/publish --no-restore

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Test.Api.dll"]