# DeveSWEAgentsBuilder
This GitHub repo builds SWE Agents to a docker container.

Azure works:
```
docker run --rm -it \
  --network host \
  -e LITELLM_DROP_PARAMS=true \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ./.env:/app/.env \
  -v ./trajectories:/app/trajectories/ \
  devedse/devesweagents:beta_directlycloneotherrepo \
  sweagent run \
    --agent.model.name=azure/o4-mini-blah \
    --agent.model.api_base=https://davy-m9vcs10m-eastus2.cognitiveservices.azure.com/ \
    --agent.model.api_version=2025-01-01-preview \
    --env.repo.github_url=https://github.com/devedse/DeveLanCacheUI_Backend \
    --problem_statement.github_url=https://github.com/devedse/DeveLanCacheUI_Backend/issues/64
```

You could add:
--actions.open_pr \


Testing some stuff that doesn't work:
```
docker run --rm -it \
  --network host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ./.env:/app/.env \
  devedse/devesweagents:beta_directlycloneotherrepo \
  sweagent run \
    --agent.model.name=gpt4 \
    --agent.model.per_instance_cost_limit=2.00 \
    --env.repo.github_url=https://github.com/devedse/DeveLanCacheUI_Backend \
    --problem_statement.github_url=https://github.com/devedse/DeveLanCacheUI_Backend/issues/64
```