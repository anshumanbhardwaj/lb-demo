require("dotenv").config();
import fastify from "fastify";

const server = fastify();

const DROPLET_NAME = process.env.DROPLET;

server.get("/ping", async (request, reply) => {
  return `pong from ${DROPLET_NAME}\n`;
});

server.get("/", async (request, reply) => {
  return `pong from ${DROPLET_NAME}\n`;
});

server.listen({ port: 3000, host: "0.0.0.0" }, (err, address) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }
  console.log(`Server listening at ${address}`);
});
