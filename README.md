# DeveSWEAgentsBuilder
This GitHub repo builds SWE Agents to a docker container.

Run the following command in this directory
```
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ./.env:/app/.env \
  devedse/devesweagents:beta_directlycloneotherrepo \
  sweagent run \
    --agent.model.name=gpt4 \
    --agent.model.per_instance_cost_limit=2.00 \
    --env.repo.github_url=https://github.com/devedse/DeveLanCacheUI_Backend \
    --problem_statement.github_url=https://github.com/devedse/DeveLanCacheUI_Backend/issues/64
```