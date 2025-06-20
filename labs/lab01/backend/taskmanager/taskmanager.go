package taskmanager

import (
	"errors"
	"time"
)

var (
	// ErrTaskNotFound is returned when a task is not found
	ErrTaskNotFound = errors.New("task not found")
	// ErrEmptyTitle is returned when the task title is empty
	ErrEmptyTitle = errors.New("task title cannot be empty")
	// ErrInvalidID is returned when the task ID is invalid
	ErrInvalidID = errors.New("invalid task ID")
)

// Task represents a single task
type Task struct {
	ID          int
	Title       string
	Description string
	Done        bool
	CreatedAt   time.Time
}

// TaskManager manages a collection of tasks
type TaskManager struct {
	tasks  map[int]*Task
	nextID int
}

// NewTaskManager creates a new task manager
func NewTaskManager() *TaskManager {
	// TODO: Implement task manager initialization

	TM := &TaskManager{
		tasks: make(map[int]*Task),
		nextID: 1,
	}
	return TM
}

// AddTask adds a new task to the manager
func (tm *TaskManager) AddTask(title, description string) (*Task, error) {
	// TODO: Implement task addition
	if(len(title) == 0){
		return nil, ErrEmptyTitle
	}
	tm.tasks[tm.nextID] = &Task{
			ID: tm.nextID,
			Title: title,
			Description: description,
			Done: false,
			CreatedAt: time.Now(),
		}
	
	return tm.tasks[tm.nextID], nil
}

// UpdateTask updates an existing task
func (tm *TaskManager) UpdateTask(id int, title, description string, done bool) error {
	// TODO: Implement task update
	if(id <= 0){
		return ErrInvalidID
	}
	task, exists := tm.tasks[id]
	if(!exists){
		return ErrTaskNotFound
	}
	if len(title)==0 {
		return ErrEmptyTitle
	}
	newTask := &Task{
			ID: id,
			Title: title,
			Description: description,
			Done: done,
			CreatedAt: task.CreatedAt,
		}
	tm.tasks[id] = newTask
	return nil
}

// DeleteTask removes a task from the manager
func (tm *TaskManager) DeleteTask(id int) error {
	// TODO: Implement task deletion
	if(id <= 0){
		return ErrInvalidID
	}
	if(tm.tasks[id] == nil){
		return ErrTaskNotFound
	}
	delete(tm.tasks, id)
	return nil
}

// GetTask retrieves a task by ID
func (tm *TaskManager) GetTask(id int) (*Task, error) {
	// TODO: Implement task retrieval
	if(id <= 0){
		return nil, ErrInvalidID
	}
	task, exists := tm.tasks[id]
	if(!exists ){
		return nil, ErrTaskNotFound
	}

	return task, nil
}

// ListTasks returns all tasks, optionally filtered by done status
func (tm *TaskManager) ListTasks(filterDone *bool) []*Task {
	var list []*Task

	for i := 0; i < tm.nextID; i++ {
		if(tm.tasks[i] != nil){
			list = append(list, tm.tasks[i])
		}
	}
	// TODO: Implement task listing with optional filter
	return list
}
