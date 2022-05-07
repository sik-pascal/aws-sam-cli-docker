
FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim AS net
RUN apt-get update && apt-get -y install zip && apt-get -y install git

FROM python:3.8-slim AS py
RUN pip install aws-sam-cli

FROM net as final
COPY --from=py . .
ENV PATH="/root/.dotnet/tools:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /sam
# CMD tail -f /dev/null