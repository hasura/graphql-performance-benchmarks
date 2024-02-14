import * as path from "https://deno.land/std/path/mod.ts";
import { sortBy } from "https://deno.land/std@0.204.0/collections/sort_by.ts";

const metricsDir = "./output"

let collatedSummary = {}

for await (const file of Deno.readDir(metricsDir)) {
    //console.log(file.name)
    if (file.isFile && !file.name.startsWith('.')) {
        let summary = JSON.parse(await Deno.readTextFile(path.join(metricsDir, file.name)))
	    //console.log(summary.root_group.name)
        //console.log(file.name, summary.root_group.name, summary.metrics.vus.value, summary.metrics.http_req_waiting.avg)
	    let grpName = file.name.split("-",2).join(" ")
	    //console.log(grpName)
        if (!collatedSummary[grpName]) {
            collatedSummary[grpName] = []
        }
        collatedSummary[grpName].push({
            vus: summary.metrics.vus_max.value,
            rps: summary.metrics.iterations.rate,
            httpTtfbAvg: summary.metrics.http_req_waiting.avg,
	    errors: summary.metrics.http_req_failed.value
        })
    }
}

let testQueries = Object.keys(collatedSummary)
testQueries.forEach((query) => {
    collatedSummary[query] = sortBy(collatedSummary[query], (summary) => summary.vus)
})
console.log(collatedSummary)

export {}
