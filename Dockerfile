FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS base
WORKDIR /app
EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80

FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
WORKDIR /src
COPY ["catalog-api-freecodecamp.csproj", "./"]
RUN dotnet restore "catalog-api-freecodecamp.csproj"
COPY . .
RUN dotnet publish "catalog-api-freecodecamp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "catalog-api-freecodecamp.dll"]
