# Repository Corruption:
```
HEAD not found. Creating the first commit. 
```
- .git folder got corrupted
```
Initialized empty Git repository 
```
- Starting fresh again
```
Unable to lookup remote [-3] 
```
- Remote config lost
# SSH Connection Issues:

```
Failed to open SSH channel 
```
- Network/SSH problems
```
SSH could not write data 
```
- Connection drops
# Push Conflicts:



```
- You need to pull first
```
cannot push non-fastforwardable reference 
```
- History diverged

 
 # Debug Log - a-Shell Git Errors & Solutions

## Error: Unable to lookup remote [-3]
**Problem**: Remote 'origin' does not exist  
**Solution**: `lg2 remote add origin git@github.com:user/repo.git`

## Error: Error pushing [-11] - cannot push because remote contains commits
**Problem**: Remote has commits your local repo doesn't have  
**Solution**: `lg2 pull origin` then `lg2 push`

## Error: Error pushing [-11] - cannot push non-fastforwardable reference  
**Problem**: Histories diverged
**Solution**: `lg2 push --force` or create new branch

## Error: Error pushing [-1] - not a valid reference 'main'
**Problem**: Branch doesn't exist locally
**Solution**: `lg2 branch main` then `lg2 checkout main`

## Error: Unable to lookup remote [-12] - invalid remote name
**Problem**: Wrong push syntax (`origin:branch`)
**Solution**: Use `lg2 push origin branch` or `lg2 push --set-upstream origin branch`
