<?php

namespace App\Console\Commands\PlannerBot;

use App\Negocio\PlannerBot\PlannerBot;
use Illuminate\Console\Command;

class DailyPlanner extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'planner-bot:daily-planner';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->info(json_encode(PlannerBot::dailyPlanner(), JSON_PRETTY_PRINT));
    }
}
