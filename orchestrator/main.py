import asyncio
import aiohttp
import json
import re

async def call_server(session, port, tasks):
    url = f'http://localhost:{port}/'
    async with session.post(url, json=tasks) as resp:
        return await resp.json()

async def main():
    async with aiohttp.ClientSession() as session:
        # Call Commander on port 8001
        async with session.get('http://localhost:8001/') as resp:
            data = await resp.text()
        
        # Strip <think> tags
        data = re.sub(r'<think>.*?</think>', '', data, flags=re.DOTALL)
        
        # Parse JSON array
        tasks = json.loads(data)
        
        # Split in half
        mid = len(tasks) // 2
        first_half = tasks[:mid]
        second_half = tasks[mid:]
        
        # Call ports 8002 and 8003 in parallel
        results1, results2 = await asyncio.gather(
            call_server(session, 8002, first_half),
            call_server(session, 8003, second_half)
        )
        
        # Merge results (assuming they return lists)
        merged_results = results1 + results2
        
        print(json.dumps(merged_results, indent=2))

if __name__ == '__main__':
    asyncio.run(main())