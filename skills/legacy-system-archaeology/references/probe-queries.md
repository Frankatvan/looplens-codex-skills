# Probe Queries

Use only the probes relevant to the target stack. Start narrow.

## Entry points

```bash
rg -n "main\\(|if __name__ == ['\"]__main__['\"]|app.listen\\(|createServer\\(|FastAPI\\(|Flask\\(|express\\(|Router\\(" .
rg -n "command\\(|click\\.command|argparse|typer|cobra\\.Command|urfave/cli" .
```

## Routes and handlers

```bash
rg -n "GET|POST|PUT|DELETE|patch|router\\.|app\\.|Blueprint|APIRouter|@app\\.|@router\\." .
```

## Timers, cron, jobs

```bash
rg -n "cron|OnCalendar|schedule|celery|beat|rq|bull|agenda|timer|launchd|systemd|daemon" .
find . -path "*systemd*" -o -path "*launchd*" -o -name "crontab*" -o -name "*.timer" -o -name "*.service"
```

## Queues and async work

```bash
rg -n "queue|enqueue|dequeue|publish|consume|worker|job|task|kafka|rabbit|sqs|redis" .
```

## State and persistence

```bash
rg -n "CREATE TABLE|ALTER TABLE|migration|schema|prisma|sequelize|sqlalchemy|gorm|knex|typeorm|diesel" .
rg -n "s3|bucket|blob|filesystem|writeFile|readFile|open\\(|pickle|json.dump|json.load" .
```

## Data entry, mutation, reuse, and reconciliation

```bash
rg -n "insert|update|delete|save|create|submit|approve|review|lock|publish|retire|sync|import|upload|manual|adjust|override|correction|reconcile|validate|check|diff|variance|match|mismatch" .
rg -n "export|download|report|sheet|spreadsheet|xlsx|xls|csv|pdf|formula|total|subtotal|balance|ledger|journal|snapshot|watermark|source row|source_row|row_id|trace|lineage" .
rg -n "select.*from|join|group by|sum\\(|count\\(|case when|where .*code|where .*id|where .*long|where .*guid" .
```

## Duplicate data capture and drift

```bash
rg -n "copy|clone|duplicate|temp|tmp|backup|history|archive|shadow|staging|cache|derived|materialized|denormalized|manual|spreadsheet|excel" .
rg -n "source|origin|externalId|businessId|entityId|objectId|containerId|parentId|code|number|amount|quantity|date|status|state|version|type|category" .
```

## Identity, migration, and re-parenting

```bash
rg -n "permanentId|stableId|externalId|businessId|stageId|runtimeId|displayCode|history|migrate|migration|moveTo|move|clone\\(|copy\\(|lock(ed)?|archive|reparent|parentId|containerId|tenantId|orgId|groupId" .
rg -n "substring\\(|startsWith\\(|endsWith\\(|prefix|parentCode|containerCode|displayCode|path|ancestor|descendant" .
```

## Permissions, roles, and data scope

```bash
rg -n "role|permission|permiss|resource|scope|policy|grant|deny|allow|canRead|canWrite|canUpdate|canDelete|user_permission|role_permission|users_role" .
rg -n "hasPermission\\(|hasRole\\(|canAccess\\(|authorize\\(|checkPermission\\(|get.*Permission|get.*Scope" .
rg -n "@PreAuthorize|@Secured|@RolesAllowed|SecurityFilterChain|OncePerRequestFilter|HandlerInterceptor|authorizeHttpRequests|antMatchers|requestMatchers|401|403|forbidden|unauthorized|gateway|authz|authn" .
```

## Org bindings and routing ownership

```bash
rg -n "dept|department|team|org|organization|company|tenant|workspace|owner|assignee|position|matrix|routing|route" .
```

## Workflow and approval surfaces

```bash
rg -n "workflow|flow|task|message|approve|approval|review|reviewer|assignee|assignment|decision|transition|stateMachine|processDefinition|signature|delegation" .
find . -name "*workflow*" -o -name "*process*" -o -name "*state*" -o -path "*workflow*" -o -path "*process*"
```

## External dependencies

```bash
rg -n "http://|https://|fetch\\(|axios|requests\\.|httpx|grpc|boto3|openai|slack|telegram|stripe|twilio" .
```

## Config and secrets surfaces

```bash
rg -n "ENV|os\\.environ|process\\.env|dotenv|config\\.|settings\\.|secret|token|api[_-]?key" .
```

## Tests as specification hints

```bash
find . -path "*test*" -o -path "*spec*"
rg -n "describe\\(|test\\(|it\\(|pytest|unittest|integration|e2e" .
```

## Ownership and history

```bash
git log --stat -- <path>
git blame <file>
```
